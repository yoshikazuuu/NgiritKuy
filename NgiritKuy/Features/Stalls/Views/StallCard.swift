//
//  StallCard.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 07/04/25.
//

import SwiftUI

struct StallCard: View {
    let product: Product
    @State private var isLiked = false
    @Binding var likedProductIDs: Set<UUID>

    var body: some View {
        VStack(alignment: .leading) {
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
            VStack (alignment: .leading) {
                HStack {
                    Text(product.title)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                    Spacer()
                    Button(action: {
                        if likedProductIDs.contains(product.id) {
                            likedProductIDs.remove(product.id)
                        } else {
                            likedProductIDs.insert(product.id)
                        }
                        print(likedProductIDs)
                    }) {
                        Image(systemName: likedProductIDs.contains(product.id) ? "heart.fill" : "heart")
                            .foregroundStyle(.red)
                    }

                }
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "location.fill")
                            .font(.caption)
                            .foregroundStyle(.orange)
                        Text("500 m away")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
                Text("Harga mulai Rp\(Int(product.minPrice))")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(10)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}


#Preview {
    StallCard(product: Product(image: "food", title: "Product 1", price: 99, category: "Tech", location: "GOP 1",     menus: [
        MenuItem(image: "seblak", name: "Seblak Pedas", description: "Seblak dengan kuah pedas khas Bandung.", price: 250),
        MenuItem(image: "mie-goreng", name: "Mie Goreng Spesial", description: "Mie goreng dengan topping ayam dan telur.", price: 30),
        MenuItem(image: "nasi-goreng", name: "Nasi Goreng Kampung", description: "Nasi goreng khas dengan bumbu rempah.", price: 30),
        MenuItem(image: "es-teh", name: "Es Teh Manis", description: "Teh manis segar dengan es batu.", price: 10)
    ]),
              likedProductIDs: .constant([]))
}
