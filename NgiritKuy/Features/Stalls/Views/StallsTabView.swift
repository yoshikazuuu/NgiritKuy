//
//  FoodView.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 04/04/25.
//

import CoreLocation
import SwiftData
import SwiftUI
import TipKit

struct StallsTabView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var gameCenter = GameCenterManager.shared
    @StateObject private var locationManager = LocationManager()
    
    // Filter states
    @State private var selectedPriceRange: PriceRange?
    @State private var selectedArea: String?
    @State private var selectedFoodType: MenuType?
    @State private var showFavoritesOnly = false
    @State private var showVisitedOnly = false
    
    // Modal states for filter sheets
    @State private var showMainFilterModal = false
    @State private var showPriceFilterModal = false
    @State private var showLocationFilterModal = false
    @State private var showCuisineFilterModal = false
    @State private var showAchievementAuthModal = false
    
    // Confirmation dialog states for reset actions
    @State private var showUserProgressResetConfirmation = false
    @State private var showAchievementResetConfirmation = false
    @State private var showUserDefaultsResetConfirmation = false
    
    // Query for all stalls (sorted by name)
    @Query var stalls: [Stall]
    
    // Local copy filtered for display
    @State private var displayedStalls: [Stall] = []
    @State private var isFiltering = false
    @State private var filterTask: Task<Void, Never>?
    private let filterDebounceTime: TimeInterval = 0.3
    
    // Tip group for hints (TipKit)
    @State private var stallTips = TipGroup(.ordered) {
        StallDetailTip()
        FilterTip()
        FavoriteTip()
        AchievementTip()
    }
    
    // Game Center Achievement state
    @State private var isShowingAchievement = false
    
    init() {
        // Fetch all stalls sorted by name
        _stalls = Query(sort: \Stall.name)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // --- Filter Header ---
                FilterHeaderView(
                    selectedPriceRange: $selectedPriceRange,
                    selectedArea: $selectedArea,
                    selectedFoodType: $selectedFoodType,
                    showFavoritesOnly: $showFavoritesOnly,
                    showVisitedOnly: $showVisitedOnly,
                    onMainFilterTapped: { showMainFilterModal = true },
                    onPriceFilterTapped: { showPriceFilterModal = true },
                    onLocationFilterTapped: { showLocationFilterModal = true },
                    onCuisineFilterTapped: { showCuisineFilterModal = true },
                    stallTips: stallTips
                )
                .padding(.horizontal, 16)
                
                // --- Main Content ---
                Group {
                    if isFiltering {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else if displayedStalls.isEmpty {
                        EmptyStateView()
                    } else {
                        StallsGridView(
                            stalls: displayedStalls,
                            locationManager: locationManager,
                            stallTips: stallTips,
                            allStalls: stalls
                        )
                    }
                }
            }
            .navigationTitle("Food Stalls")
            .navigationBarTitleDisplayMode(.large)
            // --- Toolbar with Achievement and Reset Menu ---
            .toolbar {
                // Game Center Achievement Button (trailing)
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if gameCenter.isAuthenticated {
                            isShowingAchievement = true
                        } else {
                            // Attempt authentication if not already authenticated
                            showAchievementAuthModal = true
                        }
                    } label: {
                        Image("gamecenter.achievement")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 34)
                            .foregroundColor(.accent)
                            .popoverTip(
                                stallTips.currentTip as? AchievementTip,
                                arrowEdge: .top
                            )
                    }
                }
                // Reset Menu (leading) with three options
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu {
                        Button("Reset All User Progress", role: .destructive) {
                            showUserProgressResetConfirmation = true
                        }
                        Button("Reset Achievements", role: .destructive) {
                            showAchievementResetConfirmation = true
                        }
                        Button("Reset User Defaults", role: .destructive) {
                            showUserDefaultsResetConfirmation = true
                        }
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.primary)
                    }
                }
            }
            // --- Achievement Modal Sheet ---
            .sheet(isPresented: $isShowingAchievement) {
                GameCenterAchievementsView(isPresented: $isShowingAchievement)
                    .environmentObject(gameCenter)
                    .presentationDetents([.medium])
            }
            // --- Filter Modal Sheets ---
            .sheet(isPresented: $showMainFilterModal) {
                MainFilterView(
                    selectedPriceRange: $selectedPriceRange,
                    selectedArea: $selectedArea,
                    selectedFoodType: $selectedFoodType,
                    showFavoritesOnly: $showFavoritesOnly,
                    showVisitedOnly: $showVisitedOnly
                )
                .presentationDragIndicator(.visible)
            }
            .sheet(isPresented: $showPriceFilterModal) {
                PriceFilterView(selectedPriceRange: $selectedPriceRange)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
            .sheet(isPresented: $showLocationFilterModal) {
                LocationFilterView(selectedArea: $selectedArea)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
            .sheet(isPresented: $showCuisineFilterModal) {
                CuisineFilterView(selectedFoodType: $selectedFoodType)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
            .sheet(isPresented: $showAchievementAuthModal) {
                AchievementAuthView()
                    .presentationDetents([.medium])
            }
            // --- Confirmation Dialogs ---
            .confirmationDialog("Reset All User Progress",
                                  isPresented: $showUserProgressResetConfirmation,
                                  titleVisibility: .visible) {
                Button("Reset All User Progress", role: .destructive) {
                    resetAllUserProgress()
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("This will clear all your progress—including favorites, visited markers, and all achievement metrics.")
            }
            .confirmationDialog("Reset Achievements",
                                  isPresented: $showAchievementResetConfirmation,
                                  titleVisibility: .visible) {
                Button("Reset Achievements", role: .destructive) {
                    resetAchievements()
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("This will reset your achievements on Game Center and locally.")
            }
            .confirmationDialog("Reset User Defaults",
                                  isPresented: $showUserDefaultsResetConfirmation,
                                  titleVisibility: .visible) {
                Button("Reset User Defaults", role: .destructive) {
                    resetUserDefaults()
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("This will clear all persistent user defaults (such as Game Center authentication flags).")
            }
            // --- Filtering Updates ---
            .onChange(of: stalls) { _, _ in updateFilteredStalls() }
            .onChange(of: selectedPriceRange) { _, _ in updateFilteredStalls() }
            .onChange(of: selectedArea) { _, _ in updateFilteredStalls() }
            .onChange(of: selectedFoodType) { _, _ in updateFilteredStalls() }
            .onChange(of: showFavoritesOnly) { _, _ in updateFilteredStalls() }
            .onChange(of: showVisitedOnly) { _, _ in updateFilteredStalls() }
            .onAppear {
                updateFilteredStalls()
            }
        }
    }
    
    // MARK: - Filtering
    
    private func updateFilteredStalls() {
        filterTask?.cancel()
        filterTask = Task {
            await MainActor.run { isFiltering = true }
            try? await Task.sleep(for: .seconds(filterDebounceTime))
            if Task.isCancelled { return }
            
            var predicateFilters: [Predicate<Stall>] = []
            if let areaName = selectedArea {
                predicateFilters.append(
                    #Predicate<Stall> { stall in
                        stall.area?.name == areaName
                    }
                )
            }
            if let range = selectedPriceRange {
                let minPrice = range.min
                let maxPrice = range.max
                if maxPrice.isInfinite {
                    predicateFilters.append(
                        #Predicate<Stall> { stall in
                            stall.averagePrice >= minPrice
                        }
                    )
                } else {
                    predicateFilters.append(
                        #Predicate<Stall> { stall in
                            stall.averagePrice >= minPrice &&
                            stall.averagePrice <= maxPrice
                        }
                    )
                }
            }
            if showFavoritesOnly {
                predicateFilters.append(
                    #Predicate<Stall> { stall in
                        stall.isFavorite == true
                    }
                )
            }
            if showVisitedOnly {
                predicateFilters.append(
                    #Predicate<Stall> { stall in
                        stall.isVisited == true
                    }
                )
            }
            let finalPredicate: Predicate<Stall>
            if predicateFilters.isEmpty {
                finalPredicate = #Predicate<Stall> { _ in true }
            } else {
                var combined = predicateFilters[0]
                for i in 1..<predicateFilters.count {
                    let current = combined
                    let next = predicateFilters[i]
                    combined = #Predicate<Stall> { stall in
                        current.evaluate(stall) && next.evaluate(stall)
                    }
                }
                finalPredicate = combined
            }
            if Task.isCancelled { return }
            var fetchDescriptor = FetchDescriptor<Stall>(predicate: finalPredicate)
            fetchDescriptor.sortBy = [SortDescriptor(\Stall.name)]
            do {
                let context = modelContext
                let filtered = try await Task.detached(priority: .userInitiated) {
                    let allStalls = try context.fetch(fetchDescriptor)
                    if let cuisineType = await selectedFoodType {
                        return allStalls.filter { stall in
                            stall.menu.contains { menu in
                                menu.menuType == cuisineType
                            }
                        }
                    }
                    return allStalls
                }.value
                if Task.isCancelled { return }
                await MainActor.run {
                    displayedStalls = filtered
                    isFiltering = false
                    print("Filtered to \(filtered.count) stalls (cuisine: \(selectedFoodType?.rawValue ?? "none"))")
                }
            } catch {
                if !Task.isCancelled {
                    await MainActor.run {
                        print("Error filtering stalls: \(error)")
                        displayedStalls = []
                        isFiltering = false
                    }
                }
            }
        }
    }
    
    // MARK: - Reset Functions
    
    /// Reset everything related to user progress including progress metrics,
    /// stall favorites/visited, and food menu favorites.
    private func resetAllUserProgress() {
        Task { @MainActor in
            // 1. Reset the UserProgress entities.
            let progressDescriptor = FetchDescriptor<UserProgress>()
            do {
                let progresses = try modelContext.fetch(progressDescriptor)
                for progress in progresses {
                    progress.favoriteStallCount = 0
                    progress.visitedStallCount = 0
                    progress.distinctAreasVisited = []
                    progress.favoriteMenuCount = 0
                    progress.favoriteFoodsUnder10k = 0
                    progress.locateCount = 0
                    progress.maxFavoritesInSingleArea = 0
                    progress.maxFavoriteMenusInStall = 0
                    progress.completedAchievements = []
                    progress.lastUpdated = Date()
                }
                try modelContext.save()
                print("User progress reset successfully.")
            } catch {
                print("Error resetting user progress: \(error)")
            }
            
            // 2. Reset all Stall objects: clear favorites and visited markers.
            let stallDescriptor = FetchDescriptor<Stall>()
            do {
                let stallResults = try modelContext.fetch(stallDescriptor)
                for stall in stallResults {
                    stall.isFavorite = false
                    stall.isVisited = false
                }
                try modelContext.save()
                print("Stalls reset successfully.")
            } catch {
                print("Error resetting stalls: \(error)")
            }
            
            // 3. Reset all FoodMenu objects (favorite flag).
            let menuDescriptor = FetchDescriptor<FoodMenu>()
            do {
                let menuResults = try modelContext.fetch(menuDescriptor)
                for menu in menuResults {
                    menu.isFavorite = false
                }
                try modelContext.save()
                print("Food menus reset successfully.")
            } catch {
                print("Error resetting food menus: \(error)")
            }
            
            AchievementTracker.shared.refreshMetrics()
        }
    }
    
    /// Reset achievements by invoking Game Center's reset mechanism.
    private func resetAchievements() {
        GameCenterManager.shared.resetAchievements()
        AchievementTracker.shared.refreshMetrics()
    }
    
    /// Reset user defaults (for example, clearing Game Center auth flag).
    private func resetUserDefaults() {
        UserDefaults.standard.removeObject(forKey: "hasAuthenticatedWithGameCenter")
        print("User defaults reset successfully.")
    }
}
