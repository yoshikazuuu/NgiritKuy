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

    // Calculate the width of the image
    private let totalHorizontalPadding: CGFloat = 20 * 2
    private let imageHeight: CGFloat = 120

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                if let imageData = stall.image,
                    let uiImage = UIImage(data: imageData)
                {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: .infinity, height: imageHeight)
                        .clipped()
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 12, style: .continuous))
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: .infinity, height: imageHeight)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 12, style: .continuous)
                        )
                        .overlay {
                            Image(systemName: "fork.knife")
                                .font(.system(size: 30))
                                .foregroundStyle(.gray)
                        }
                }
            }

            VStack(alignment: .leading) {
                HStack {
                    Text(stall.name)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                    Spacer()
                    Button(action: {
                        stall.isFavorite.toggle()
                    }) {
                        Image(
                            systemName: stall.isFavorite
                                ? "heart.fill" : "heart"
                        )
                        .foregroundStyle(.red)
                    }

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
