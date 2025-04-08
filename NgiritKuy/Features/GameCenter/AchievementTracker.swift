//
//  AchievementTracker.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 08/04/25.
//

import Foundation
import GameKit
import SwiftData

class AchievementTracker: ObservableObject {
    static let shared = AchievementTracker()

    private var lastRefreshTime = Date.distantPast
    private let minimumRefreshInterval: TimeInterval = 2.0

    @Published var userProgress: UserProgress?
    @Published var isUpdating: Bool = false

    private var context: ModelContext?
    private let updateQueue = DispatchQueue(
        label: "com.ngiritKuy.achievements", qos: .background)

    // Initialize with context
    func initialize(context: ModelContext) {
        self.context = context
        loadOrCreateUserProgress()
    }

    private func loadOrCreateUserProgress() {
        guard let context = context else { return }

        Task { @MainActor in
            let descriptor = FetchDescriptor<UserProgress>()
            do {
                let existingProgress = try context.fetch(descriptor)
                if let progress = existingProgress.first {
                    self.userProgress = progress
                } else {
                    let newProgress = UserProgress()
                    context.insert(newProgress)
                    try context.save()
                    self.userProgress = newProgress
                }
            } catch {
                print("Error loading user progress: \(error)")
            }
        }
    }

    // Public method for refreshing all metrics asynchronously
    func refreshMetrics() {
        guard !isUpdating, let context = context else { return }

        // Check if we've refreshed recently
        let now = Date()
        if now.timeIntervalSince(lastRefreshTime) < minimumRefreshInterval {
            // Schedule a refresh for later instead of doing it immediately
            DispatchQueue.main.asyncAfter(
                deadline: .now() + minimumRefreshInterval
            ) { [weak self] in
                self?.refreshMetrics()
            }
            return
        }

        lastRefreshTime = now
        isUpdating = true
        updateQueue.async { [weak self] in
            guard let self = self else { return }

            // Perform data queries on background thread
            let metrics = self.calculateMetrics(context: context)

            // Update on main thread
            DispatchQueue.main.async {
                self.updateProgressWithMetrics(metrics)
                self.checkAndReportAchievements()
                self.isUpdating = false
            }
        }
    }

    // Calculate all metrics on background thread
    // Calculate all metrics on background thread
    private func calculateMetrics(context: ModelContext) -> [String: Any] {
        var metrics: [String: Any] = [:]

        do {
            // --- Stall Metrics ---
            // Fetch full Stall objects matching the predicate
            let stallDescriptor = FetchDescriptor<Stall>(
                predicate: #Predicate { $0.isFavorite || $0.isVisited }
            )
            // REMOVED: stallDescriptor.propertiesToFetch = [...]
            let stalls = try context.fetch(stallDescriptor)

            // Process the fetched Stall objects
            let favoriteStalls = stalls.filter { $0.isFavorite }
            let visitedStalls = stalls.filter { $0.isVisited }

            metrics["favoriteStallCount"] = favoriteStalls.count
            metrics["visitedStallCount"] = visitedStalls.count

            // Areas visited - access area relationship from fetched objects
            let visitedAreaIDs = Set(visitedStalls.compactMap { $0.area?.id })
            metrics["distinctAreasVisited"] = visitedAreaIDs

            // Max favorites in a single area - access area relationship
            let areaDict = Dictionary(
                grouping: favoriteStalls.filter { $0.area != nil },
                by: { $0.area!.id }  // Access area.id after fetching
            )
            metrics["maxFavoritesInSingleArea"] =
                areaDict.values.map { $0.count }.max() ?? 0

            // --- Menu Metrics ---
            // Fetch full FoodMenu objects matching the predicate
            let menuDescriptor = FetchDescriptor<FoodMenu>(
                predicate: #Predicate { $0.isFavorite }
            )
            // REMOVED: menuDescriptor.propertiesToFetch = [...]
            let menus = try context.fetch(menuDescriptor)

            // Process the fetched FoodMenu objects
            let favoriteMenus = menus  // Already filtered by predicate
            metrics["favoriteMenuCount"] = favoriteMenus.count

            // Favorites under 10k
            let favFoodsUnder10k = favoriteMenus.filter { $0.price < 10 }
            metrics["favoriteFoodsUnder10k"] = favFoodsUnder10k.count

            // Max favorites in a single stall - access stall relationship
            let stallMenuDict = Dictionary(
                grouping: favoriteMenus.filter { $0.stall != nil },
                by: { $0.stall!.id }  // Access stall.id after fetching
            )
            metrics["maxFavoriteMenusInStall"] =
                stallMenuDict.values.map { $0.count }.max() ?? 0

        } catch {
            print("Error calculating metrics: \(error)")
        }

        return metrics
    }

    // Update the progress model with new metrics
    private func updateProgressWithMetrics(_ metrics: [String: Any]) {
        guard let userProgress = userProgress else { return }

        if let count = metrics["favoriteStallCount"] as? Int {
            userProgress.favoriteStallCount = count
        }

        if let count = metrics["visitedStallCount"] as? Int {
            userProgress.visitedStallCount = count
        }

        if let areaIDs = metrics["distinctAreasVisited"] as? Set<UUID> {
            userProgress.distinctAreasVisited = areaIDs
        }

        if let count = metrics["favoriteMenuCount"] as? Int {
            userProgress.favoriteMenuCount = count
        }

        if let count = metrics["favoriteFoodsUnder10k"] as? Int {
            userProgress.favoriteFoodsUnder10k = count
        }

        if let count = metrics["maxFavoritesInSingleArea"] as? Int {
            userProgress.maxFavoritesInSingleArea = count
        }

        if let count = metrics["maxFavoriteMenusInStall"] as? Int {
            userProgress.maxFavoriteMenusInStall = count
        }

        userProgress.lastUpdated = Date()
        saveProgress()
    }

    // Check and report achievements based on current progress
    private func checkAndReportAchievements() {
        guard let progress = userProgress else { return }

        // Favorite stall achievements
        reportAchievement(
            identifier: "lowFav", current: Double(progress.favoriteStallCount),
            required: 1)
        reportAchievement(
            identifier: "medFav", current: Double(progress.favoriteStallCount),
            required: 3)
        reportAchievement(
            identifier: "highFav", current: Double(progress.favoriteStallCount),
            required: 7)

        // Visit achievements
        reportAchievement(
            identifier: "visitedFiveStalls",
            current: Double(progress.visitedStallCount), required: 5)

        // Area exploration
        reportAchievement(
            identifier: "lowExploreDistinct",
            current: Double(progress.distinctAreasVisited.count), required: 2)
        reportAchievement(
            identifier: "allExploreDistinct",
            current: Double(progress.distinctAreasVisited.count),
            required: Double(GOPArea.all.count))

        // Favorites in area
        reportAchievement(
            identifier: "lowFavInArea",
            current: Double(progress.maxFavoritesInSingleArea), required: 3)
        reportAchievement(
            identifier: "medFavInArea",
            current: Double(progress.maxFavoritesInSingleArea), required: 5)

        // Food under 10k
        reportAchievement(
            identifier: "favFoodUnder10k",
            current: Double(progress.favoriteFoodsUnder10k), required: 4)

        // Favorites in stall
        reportAchievement(
            identifier: "favThreeFoodInStall",
            current: Double(progress.maxFavoriteMenusInStall), required: 3)

        // Locate achievement
        reportAchievement(
            identifier: "firstLocate", current: Double(progress.locateCount),
            required: 1)
    }

    // Report achievement progress to Game Center
    private func reportAchievement(
        identifier: String, current: Double, required: Double
    ) {
        guard let progress = userProgress else { return }

        // Skip if already marked as completed
        if progress.completedAchievements.contains(identifier) {
            return
        }

        let percentage = min(100, (current / required) * 100)

        GameCenterManager.shared.reportAchievement(
            identifier: identifier,
            percentComplete: percentage
        )

        // Mark as completed if 100%
        if percentage >= 100
            && !progress.completedAchievements.contains(identifier)
        {
            progress.completedAchievements.append(identifier)
            saveProgress()
        }
    }

    // Increment locate count
    func didUseLocate() {
        guard let userProgress = userProgress else { return }

        updateQueue.async { [weak self] in
            DispatchQueue.main.async {
                userProgress.locateCount += 1
                self?.saveProgress()
                self?.reportAchievement(
                    identifier: "firstLocate",
                    current: Double(userProgress.locateCount), required: 1)
            }
        }
    }

    // Save progress
    private func saveProgress() {
        guard let context = context else { return }

        do {
            try context.save()
        } catch {
            print("Error saving user progress: \(error)")
        }
    }
}
