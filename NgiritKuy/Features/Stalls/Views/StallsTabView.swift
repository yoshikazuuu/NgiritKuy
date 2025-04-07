//
//  FoodView.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 04/04/25.
//

import SwiftUI
import SwiftData

struct StallView: View {
    let products: [Product]
    @Binding var likedProductIDs: Set<UUID>
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(products) { product in
                        NavigationLink(destination: DetailStall(stall: product)) {
                            StallCard(product: product, likedProductIDs: $likedProductIDs)
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

#Preview {
    StallView(
        products: [
            Product(image: "stall", title: "Stall", price: 15000, category: "Preview", location: "Preview", menus: [])
        ],
        likedProductIDs: .constant([])
    )
}
