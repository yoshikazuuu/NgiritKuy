//
//  FilterHeaderView.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 09/04/25.
//

import SwiftUI
import TipKit

struct FilterHeaderView: View {
    @Binding var selectedPriceRange: PriceRange?
    @Binding var selectedArea: String?
    @Binding var selectedFoodType: MenuType?
    @Binding var showFavoritesOnly: Bool
    @Binding var showVisitedOnly: Bool
    
    let onMainFilterTapped: () -> Void
    let onPriceFilterTapped: () -> Void
    let onLocationFilterTapped: () -> Void
    let onCuisineFilterTapped: () -> Void
    var stallTips: TipGroup
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                Button(action: onMainFilterTapped) {
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
                
                // Active filters
                if let range = selectedPriceRange {
                    FilterPillButton(
                        title: "Price: \(range.displayName)",
                        isActive: true
                    ) { onPriceFilterTapped() }
                }
                if let area = selectedArea {
                    FilterPillButton(
                        title: "Location: \(area)",
                        isActive: true
                    ) { onLocationFilterTapped() }
                }
                if let cuisine = selectedFoodType {
                    FilterPillButton(
                        title: "Cuisine: \(cuisine.rawValue)",
                        isActive: true
                    ) { onCuisineFilterTapped() }
                }
                if showFavoritesOnly {
                    FilterPillButton(title: "Favorites", isActive: true) {
                        showFavoritesOnly.toggle()
                    }
                }
                if showVisitedOnly {
                    FilterPillButton(title: "Visited", isActive: true) {
                        showVisitedOnly.toggle()
                    }
                }
                
                // Inactive pills for unset filters
                if selectedPriceRange == nil {
                    FilterPillButton(title: "Price", isActive: false) {
                        onPriceFilterTapped()
                    }
                }
                if selectedArea == nil {
                    FilterPillButton(title: "Location", isActive: false) {
                        onLocationFilterTapped()
                    }
                }
                if selectedFoodType == nil {
                    FilterPillButton(title: "Cuisine", isActive: false) {
                        onCuisineFilterTapped()
                    }
                }
                if !showFavoritesOnly {
                    FilterPillButton(title: "Favorites", isActive: false) {
                        showFavoritesOnly.toggle()
                    }
                }
                if !showVisitedOnly {
                    FilterPillButton(title: "Visited", isActive: false) {
                        showVisitedOnly.toggle()
                    }
                }
            }
            .padding(.vertical, 8)
        }
    }
}
