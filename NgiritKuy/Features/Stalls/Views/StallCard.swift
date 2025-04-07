//
//  StallCard.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 07/04/25.
//

import SwiftUI

struct StallCard: View {
    let stall: Stall
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack(alignment: .leading) {
            if let imageData = stall.image,
                let uiImage = UIImage(data: imageData)
            {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(4 / 3, contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .clipped()
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .aspectRatio(4 / 3, contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .overlay {
                        Image(systemName: "photo")
                            .font(.system(size: 50))
                            .foregroundStyle(.gray)
                    }
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(stall.name)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                    Spacer()
                    //                    Button(action: {
                    //                        if likedProductIDs.contains(product.id) {
                    //                            likedProductIDs.remove(product.id)
                    //                        } else {
                    //                            likedProductIDs.insert(product.id)
                    //                        }
                    //                        print(likedProductIDs)
                    //                    }) {
                    //                        Image(systemName: likedProductIDs.contains(product.id) ? "heart.fill" : "heart")
                    //                            .foregroundStyle(.red)
                    //                    }

                }
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "location.fill")
                            .font(.caption)
                            .foregroundStyle(.orange)
                        Text("500 m away")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
                Text("Harga mulai Rp\(stall.averagePrice)")
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
