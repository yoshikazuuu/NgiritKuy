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
        // Fetch all stalls
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
            .toolbar {
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
                                arrowEdge: .top)

                    }
                    // Optional: Disable button based on Game Center status
                    // .disabled(!gameCenter.isGameCenterEnabled)
                }
            }
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

    private func updateFilteredStalls() {
        // Cancel any previous filtering task
        filterTask?.cancel()

        // Create a new task for filtering
        filterTask = Task {
            // Set filtering state
            await MainActor.run { isFiltering = true }

            // Debounce - small delay to avoid rapid consecutive filters
            try? await Task.sleep(for: .seconds(filterDebounceTime))

            // Check for cancellation after delay
            if Task.isCancelled { return }

            // Build predicate for non-relationship filters
            var predicateFilters: [Predicate<Stall>] = []

            if let areaName = selectedArea {
                predicateFilters.append(
                    #Predicate<Stall> { stall in
                        stall.area?.name == areaName
                    })
            }

            if let range = selectedPriceRange {
                let minPrice = range.min
                let maxPrice = range.max
                if maxPrice.isInfinite {
                    predicateFilters.append(
                        #Predicate<Stall> { stall in
                            stall.averagePrice >= minPrice
                        })
                } else {
                    predicateFilters.append(
                        #Predicate<Stall> { stall in
                            stall.averagePrice >= minPrice
                                && stall.averagePrice <= maxPrice
                        })
                }
            }

            if showFavoritesOnly {
                predicateFilters.append(
                    #Predicate<Stall> { stall in
                        stall.isFavorite == true
                    })
            }

            if showVisitedOnly {
                predicateFilters.append(
                    #Predicate<Stall> { stall in
                        stall.isVisited == true
                    })
            }

            // Combine predicates
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

            // Check for cancellation again
            if Task.isCancelled { return }

            // Create fetch descriptor
            var fetchDescriptor = FetchDescriptor<Stall>(
                predicate: finalPredicate)
            fetchDescriptor.sortBy = [SortDescriptor(\Stall.name)]

            do {
                // Get shared context reference to use on background
                let context = modelContext

                // Perform fetch on background
                let filtered = try await Task.detached(priority: .userInitiated)
                {
                    let allStalls = try context.fetch(fetchDescriptor)

                    // Apply cuisine filter if needed
                    if let cuisineType = await selectedFoodType {
                        return allStalls.filter { stall in
                            stall.menu.contains { menu in
                                menu.menuType == cuisineType
                            }
                        }
                    }
                    return allStalls
                }.value

                // Check for cancellation before updating UI
                if Task.isCancelled { return }

                // Update UI on main thread
                await MainActor.run {
                    displayedStalls = filtered
                    isFiltering = false
                    print(
                        "Filtered to \(filtered.count) stalls (cuisine: \(selectedFoodType?.rawValue ?? "none"))"
                    )
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

}
