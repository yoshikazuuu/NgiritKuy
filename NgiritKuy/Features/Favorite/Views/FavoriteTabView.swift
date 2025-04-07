//
//  FavoritesView.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 05/04/25.
//

import Foundation
import SwiftUI

struct FavoritesView: View {
    let products: [Product]
    @Binding var likedProductIDs: Set<UUID>

    var likedProducts: [Product] {
        products.filter { likedProductIDs.contains($0.id) }
    }

    var body: some View {
        List(likedProducts) { product in
            HStack {
                Text(product.title)
                Spacer()
                Button(action: {
                    likedProductIDs.remove(product.id)
                }) {
                    Image(systemName: "heart.slash")
                        .foregroundStyle(.red)
                }
            }
        }
    }
}
