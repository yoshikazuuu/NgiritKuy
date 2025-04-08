//
//  FavoritesView.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 05/04/25.
//

import Foundation
import SwiftData
import SwiftUI
import TipKit

struct FavoritesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(
        filter: #Predicate<Stall> { stall in
            stall.isFavorite
        }) var favoritedStalls: [Stall]
    @Query private var areas: [GOPArea]

    @State private var favoriteTips = TipGroup {}

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(favoritedStalls) { stall in
                        NavigationLink(destination: DetailStall(stall: stall)) {
                            StallCard(
                                stall: stall,
                                isEligibleForTip: false,
                                tipGroup: favoriteTips)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("NgiritKuy")
        }
    }
}
