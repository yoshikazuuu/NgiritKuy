//
//  MenuItemRow.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 07/04/25.
//

import SwiftUI

struct MenuItemRow: View {
    let menu: FoodMenu
    let onToggleFavorite: () -> Void

    var body: some View {
        HStack {
            if let imageData = menu.image,
                let uiImage = UIImage(data: imageData)
            {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay {
                        Image(systemName: "fork.knife")
                            .foregroundStyle(.gray)
                    }
            }
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(menu.name)
                        .font(.headline)
                    Text(menu.desc)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
                Spacer()

                Text("\(Int(menu.price)).000")
                    .font(.headline)
                    .fontWeight(.bold)
                Button(action: onToggleFavorite) {
                    Image(systemName: menu.isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(.red)
                        .padding(8)
                }
                .buttonStyle(.plain)
                .contentShape(Rectangle())
                .sensoryFeedback(.success, trigger: menu.isFavorite)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}
