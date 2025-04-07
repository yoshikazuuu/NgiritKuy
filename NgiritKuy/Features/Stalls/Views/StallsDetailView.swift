//
//  StallsDetailView.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 07/04/25.
//

import SwiftUI

struct DetailStall: View {
    let stall: Stall
    @State private var isMarked = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // Stall Image
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
                // Stall Info
                VStack(alignment: .leading, spacing: 5) {
                    Text(stall.name)
                        .font(.title)
                        .fontWeight(.bold)

                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundStyle(.red)
                        Text(stall.area?.name ?? "")
                            .font(.subheadline)
                    }

                    Text(stall.desc)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .font(.footnote)
                        .foregroundColor(.gray)

                }
                .padding()

                // Price Summary
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        VStack {
                            Text("Min:")
                                .fontWeight(.bold)
                            Text("Rp\(stall.minimumPrice)")

                        }
                        Spacer()
                        VStack {
                            Text("Avg:")
                                .fontWeight(.bold)
                            Text("Rp\(stall.averagePrice)")
                        }
                        Spacer()
                        VStack {
                            Text("Max:")
                                .fontWeight(.bold)
                            Text("Rp\(stall.maximumPrice)")
                        }
                    }
                    .font(.subheadline)
                    .padding(.horizontal)
                }
                .padding(.horizontal)

                Divider()

                // Menu Section
                Text("Menu")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                ForEach(stall.menu) { menu in
                    MenuItemRow(menu: menu)
                }

                Divider()
                    .padding(.vertical)
                VStack(spacing: 0) {

                    Button(action: {
                        isMarked.toggle()
                    }) {
                        HStack {
                            Image(systemName: "checkmark.circle")
                            Text(isMarked ? "Visited" : "Mark as Visited")
                                .fontWeight(.medium)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isMarked ? Color.green : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }

                    .padding(.horizontal)
                    Button {
                    } label: {
                        HStack {
                            Image(systemName: "location.fill")
                            Text("Locate Me")
                                .fontWeight(.medium)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue)
                        )
                    }
                    .padding()
                }
            }
        }
        .navigationTitle(stall.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//menu component
struct MenuItemRow: View {
    let menu: FoodMenu

    var body: some View {
        HStack {
            if let imageData = menu.image, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(4/3, contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .clipped()
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .aspectRatio(4/3, contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .overlay {
                        Image(systemName: "photo")
                            .font(.system(size: 50))
                            .foregroundStyle(.gray)
                    }
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(menu.name)
                    .font(.headline)
                Text(menu.desc)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                Text("\(Int(menu.price))")
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            .padding(.leading, 10)

            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

