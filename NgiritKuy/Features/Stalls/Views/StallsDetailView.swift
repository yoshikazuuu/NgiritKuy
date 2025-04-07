//
//  StallsDetailView.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 07/04/25.
//

import SwiftUI

struct DetailStall: View {
    let stall: Product
    @State private var isMarked = false
    
    var body: some View {
        ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        // Stall Image
                        Image(stall.image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                        
                        // Stall Info
                        VStack(alignment: .leading, spacing: 5) {
                            Text(stall.title)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            HStack {
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundStyle(.red)
                                Text(stall.location)
                                    .font(.subheadline)
                            }
                            
                            Text(stall.category)
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
                                    Text("Rp\(Int(stall.minPrice))")

                                }
                                Spacer()
                                VStack {
                                    Text("Avg:")
                                        .fontWeight(.bold)
                                    Text("Rp\(Int(stall.avgPrice))")
                                }
                                Spacer()
                                VStack {
                                    Text("Max:")
                                        .fontWeight(.bold)
                                    Text("Rp\(Int(stall.maxPrice))")
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

                        ForEach(stall.menus) { menu in
                            MenuItemRow(menu: menu)
                        }
                        
                        Divider()
                            .padding(.vertical)
                        VStack(spacing: 0){
                            
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
                .navigationTitle(stall.title)
                .navigationBarTitleDisplayMode(.inline)
            }
    }

//menu component
struct MenuItemRow: View {
    let menu: MenuItem

    var body: some View {
        HStack {
            Image(menu.image)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 5) {
                Text(menu.name)
                    .font(.headline)
                Text(menu.description)
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

#Preview {
    DetailStall(stall: Product(image: "seblak", title: "Product 1", price: 15000, category: "Tech", location: "GOP 1",
                                 menus: [
                                     MenuItem(image: "seblak", name: "Seblak Pedas", description: "Seblak dengan kuah pedas khas Bandung.", price: 20000),
                                     MenuItem(image: "mie-goreng", name: "Mie Goreng Spesial", description: "Mie goreng dengan topping ayam dan telur.", price: 5000),
                                     MenuItem(image: "nasi-goreng", name: "Nasi Goreng Kampung", description: "Nasi goreng khas dengan bumbu rempah.", price: 50000),
                                     MenuItem(image: "es-teh", name: "Es Teh Manis", description: "Teh manis segar dengan es batu.", price: 11000)
                                 ]))
}
