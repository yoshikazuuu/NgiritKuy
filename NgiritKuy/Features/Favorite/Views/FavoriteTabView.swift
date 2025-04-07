//
//  FavoritesView.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 05/04/25.
//

import Foundation
import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var stalls: [Stall]
    @Query private var areas: [GOPArea]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(stalls) { stall in
                        NavigationLink(destination: DetailStall(stall: stall)) {
                            StallCard(stall: stall)
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
