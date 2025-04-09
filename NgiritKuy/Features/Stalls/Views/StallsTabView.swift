//
//  FoodView.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 04/04/25.
//

import SwiftData
import SwiftUI
import CoreLocation
import TipKit

struct StallView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var gameCenter = GameCenterManager.shared
    @StateObject private var locationManager = LocationManager()
    @Query private var stalls: [Stall]
    @Query private var areas: [GOPArea]
    
    @State private var isShowingAchievement = false
    @State private var stallTips = TipGroup(.ordered) {
        StallDetailTip()
        FilterTip()
        FavoriteTip()
        AchievementTip()
    }
    
    // Filter states
    @State private var selectedPriceRange: PriceRange?
    @State private var selectedArea: String?
    @State private var selectedFoodType: MenuType?
    @State private var showFavoritesOnly = false
    @State private var showVisitedOnly = false
    
    // Modal states
    @State private var showMainFilterModal = false
    @State private var showPriceFilterModal = false
    @State private var showLocationFilterModal = false
    @State private var showCuisineFilterModal = false
    @State private var showAchievementAuthModal = false
    
    //filter function
    private var filteredStalls: [Stall] {
        let result = stalls.filter { stall in
            // Area filter
            let areaMatches = selectedArea == nil || stall.area?.name == selectedArea
            
            // Price range filter
            let priceMatches: Bool
            if let range = selectedPriceRange {
                priceMatches = stall.averagePrice >= range.min && stall.averagePrice <= range.max
            } else {
                priceMatches = true
            }
            
            // Food type filter
            let foodTypeMatches: Bool
            if let foodType = selectedFoodType {
                foodTypeMatches = stall.menu.contains { $0.menuType == foodType }
            } else {
                foodTypeMatches = true
            }
            
            // Favorites filter
            let favoriteMatches = !showFavoritesOnly || stall.isFavorite
            
            // Favorites filter
            let visitedMatches = !showVisitedOnly || stall.isVisited
            
            return areaMatches && priceMatches && foodTypeMatches && favoriteMatches && visitedMatches
        }
        
        return result
    }

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]

    var body: some View {
        NavigationStack {
            // Filter pills row
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    // Main filter button
                        Button {
                            showMainFilterModal = true
                        } label: {
                            HStack(spacing: 6) {
                                Text("Filter")
                                    .foregroundStyle(.primary)
                                Image(systemName: "line.3.horizontal.decrease")
                            }
                            .font(.headline)
                            .frame(height: 20)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color(.systemGray6))
                            .clipShape(Capsule())
                        }
                        .popoverTip(stallTips.currentTip as? FilterTip, arrowEdge: .top)
                    
                    
                    // Main filter modal
                    .sheet(isPresented: $showMainFilterModal) {
                        MainFilterView(
                            selectedPriceRange: $selectedPriceRange,
                            selectedArea: $selectedArea,
                            selectedFoodType: $selectedFoodType,
                            showFavoritesOnly: $showFavoritesOnly,
                            showVisitedOnly: $showVisitedOnly
                        )
                    }
                    
                    // Cuisine filter pill
                    FilterPillButton(
                        title: selectedFoodType == nil ? "Cuisine" : "Cuisine: \(selectedFoodType!.rawValue)",
                        isActive: selectedFoodType != nil
                    ) {
                        showCuisineFilterModal = true
                    }
                    
                    // Price filter pill
                    FilterPillButton(
                        title: selectedPriceRange == nil ? "Price" : "Price: \(selectedPriceRange!.displayName)",
                        isActive: selectedPriceRange != nil
                    ) {
                        showPriceFilterModal = true
                    }
                    
                    // Location filter pill
                    FilterPillButton(
                        title: selectedArea == nil ? "Location" : "Location: \(selectedArea!)",
                        isActive: selectedArea != nil
                    ) {
                        showLocationFilterModal = true
                    }

                    // Favorites filter toggle pill
                    FilterPillButton(
                        title: "Favorites",
                        isActive: showFavoritesOnly
                    ) {
                        showFavoritesOnly.toggle()
                    }
                    
                    // Favorites filter toggle pill
                    FilterPillButton(
                        title: "Visited",
                        isActive: showVisitedOnly
                    ) {
                        showVisitedOnly.toggle()
                    }
                    
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
            .background(Color(.systemBackground))
            ScrollView {
                if filteredStalls.isEmpty {
                    VStack {
                        Text("No food stalls found.")
                            .font(.title3)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.top, 100)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(filteredStalls) { stall in
                            let isFirstStall = stall.id == stalls.first?.id
                            
                            NavigationLink(destination: DetailStall(stall: stall)) {
                                StallCard(stall: stall,
                                          isEligibleForTip: isFirstStall,
                                          tipGroup: stallTips)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .environmentObject(locationManager)
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Food Stalls")
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
                            .popoverTip(stallTips.currentTip as? AchievementTip, arrowEdge: .top)
                            
                    }
                    // Optional: Disable button based on Game Center status
                    // .disabled(!gameCenter.isGameCenterEnabled)
                }
            }
            .sheet(isPresented: $isShowingAchievement) {
                GameCenterAchievementsView(isPresented: $isShowingAchievement)
                    .environmentObject(gameCenter) // Pass manager to the sheet
                    .presentationDetents([.medium])
            }
            
            // Individual filter modals
            .sheet(isPresented: $showPriceFilterModal) {
                PriceFilterView(selectedPriceRange: $selectedPriceRange)
                    .presentationDetents([.medium])
            }
            .sheet(isPresented: $showLocationFilterModal) {
                LocationFilterView(selectedArea: $selectedArea)
                    .presentationDetents([.medium])
            }
            .sheet(isPresented: $showCuisineFilterModal) {
                CuisineFilterView(selectedFoodType: $selectedFoodType)
                    .presentationDetents([.medium])
            }
            .sheet(isPresented: $showAchievementAuthModal) {
                AchievementAuthView()
                    .presentationDetents([.medium])
            }
        }
    }
    
    private func calculateDistance(from userLocation: CLLocation, to stall: Stall) -> Double? {
        guard let stallArea = stall.area,
              let latitude = stallArea.latitude,
              let longitude = stallArea.longitude else {
            return nil
        }
        
        let stallLocation = CLLocation(latitude: latitude, longitude: longitude)
        return userLocation.distance(from: stallLocation)
    }
}

#Preview {
    StallView()
        .environment(\.modelContext, ModelContext(previewContainer))
        .environmentObject(GameCenterManager.shared)
        .task {
            #if DEBUG
                try? Tips.resetDatastore()
            #endif
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault),
            ])
            print("TipKit configured for Preview")
        }

}
