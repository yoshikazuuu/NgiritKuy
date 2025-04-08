//
//  AchievementTracker.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 08/04/25.
//

import Foundation
import GameKit
import SwiftData

/// This class queries the persisted data (using ModelContext),
/// evaluates various achievement criteria, and then reports
/// progress (or completion) to Game Center.
final class AchievementTracker: ObservableObject {
    static let shared = AchievementTracker()

    /// Example: Count how many times the user has used the Locate Me feature.
    @Published var locateCount: Int = 0

    private init() {}

    /// Call this method after any user action that might affect achievements.
    /// It queries the current data and reports achievement progress.
    func updateAchievements(context: ModelContext) {
        // --- Evaluate Stall-Based Achievements ---
        do {
            let stallDescriptor = FetchDescriptor<Stall>()
            let stalls = try context.fetch(stallDescriptor)

            let favoriteStalls = stalls.filter { $0.isFavorite }
            let visitedStalls = stalls.filter { $0.isVisited }

            // Achievement: lowFav – Favorite at least 1 stall.
            reportAchievement(
                identifier: "lowFav",
                current: Double(favoriteStalls.count),
                required: 1)
            // Achievement: medFav – Favorite at least 3 stalls.
            reportAchievement(
                identifier: "medFav",
                current: Double(favoriteStalls.count),
                required: 3)
            // Achievement: highFav – Favorite at least 7 stalls.
            reportAchievement(
                identifier: "highFav",
                current: Double(favoriteStalls.count),
                required: 7)

            // Achievements: Explore distinct areas.
            let visitedAreaIDs = Set(visitedStalls.compactMap { $0.area?.id })
            // lowExploreDistinct – Visited at least 2 different areas.
            reportAchievement(
                identifier: "lowExploreDistinct",
                current: Double(visitedAreaIDs.count),
                required: 2)
            // allExploreDistinct – Visited all areas (using total count from GOPArea.all).
            let totalAreas = Double(GOPArea.all.count)
            reportAchievement(
                identifier: "allExploreDistinct",
                current: Double(visitedAreaIDs.count),
                required: totalAreas)

            // Achievements: Favorite stalls in a single area.
            let favoriteStallsWithArea = favoriteStalls.filter {
                $0.area != nil
            }
            let areaDict = Dictionary(
                grouping: favoriteStallsWithArea, by: { $0.area!.id })
            let maxFavInArea = areaDict.values.map { $0.count }.max() ?? 0

            // lowFavInArea – At least 3 favorite stalls in an area.
            reportAchievement(
                identifier: "lowFavInArea",
                current: Double(maxFavInArea),
                required: 3)
            // medFavInArea – At least 5 favorite stalls in an area.
            reportAchievement(
                identifier: "medFavInArea",
                current: Double(maxFavInArea),
                required: 5)

            // visitedFiveStalls – Visit (mark as visited) at least 5 stalls.
            reportAchievement(
                identifier: "visitedFiveStalls",
                current: Double(visitedStalls.count),
                required: 5)

        } catch {
            print("Error fetching stalls for achievements: \(error)")
        }

        // --- Evaluate Food/ Menu-Based Achievements ---
        do {
            let menuDescriptor = FetchDescriptor<FoodMenu>()
            let menus = try context.fetch(menuDescriptor)

            // Achievement: favFoodUnder10k – Favorite at least 4 menu items priced lower than 10k.
            let favFoodsUnder10k = menus.filter {
                $0.isFavorite && $0.price < 10
            }
            reportAchievement(
                identifier: "favFoodUnder10k",
                current: Double(favFoodsUnder10k.count),
                required: 4)

            // Achievement: favThreeFoodInStall – In at least one stall, favorite 3 foods/drinks.
            let favoriteMenus = menus.filter { $0.isFavorite }
            let menusGroupedByStall = Dictionary(
                grouping: favoriteMenus, by: { $0.stall?.id })
            let maxFavMenusInStall =
                menusGroupedByStall.values.map { $0.count }.max() ?? 0
            reportAchievement(
                identifier: "favThreeFoodInStall",
                current: Double(maxFavMenusInStall),
                required: 3)
        } catch {
            print("Error fetching menus for achievements: \(error)")
        }

        // --- Evaluate Locate-Based Achievement ---
        // For example, "firstLocate" is achieved when the user tapped the locate button at least once.
        reportAchievement(
            identifier: "firstLocate",
            current: Double(locateCount),
            required: 1)
    }

    /// Call this function when the user taps the “Locate Me” button.
    func didUseLocate() {
        locateCount += 1
    }

    /// Helper that calculates the percentage (capped at 100) and reports to Game Center.
    private func reportAchievement(
        identifier: String,
        current: Double,
        required: Double
    ) {
        let progress = min(100, (current / required) * 100)
        
        GameCenterManager.shared.reportAchievement(
            identifier: identifier,
            percentComplete: progress)
    }
}
