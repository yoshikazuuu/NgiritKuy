//
//  ContentView.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 26/03/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var likedProductIDs: Set<UUID> = []
    
    // Dummy product list
    let products: [Product] = [
        Product(
            image: "stall",
            title: "Nasi Padang Uni Jeje",
            price: 10,
            category: "Sundanese, Padang, Indonesian",
            location: "GOP 1",
            menus: [
                MenuItem(image: "food", name: "Seblak Pedas", description: "Seblak dengan kuah pedas khas Bandung.", price: 7),
                MenuItem(image: "mie-goreng", name: "Mie Goreng Spesial", description: "Mie goreng dengan topping ayam dan telur.", price: 50),
                MenuItem(image: "nasi-goreng", name: "Nasi Goreng Kampung", description: "Nasi goreng khas dengan bumbu rempah.", price: 100),
                MenuItem(image: "es-teh", name: "Es Teh Manis", description: "Teh manis segar dengan es batu.", price: 65)
            ]
        ),
        Product(
            image: "food",
            title: "Warung Makan Sederhana",
            price: 5,
            category: "Javanese, Indonesian, Street Food",
            location: "GOP 1",
            menus: [
                MenuItem(image: "seblak", name: "Seblak Pedas", description: "Seblak dengan kuah pedas khas Bandung.", price: 80),
                MenuItem(image: "mie-goreng", name: "Mie Goreng Spesial", description: "Mie goreng dengan topping ayam dan telur.", price: 90),
                MenuItem(image: "nasi-goreng", name: "Nasi Goreng Kampung", description: "Nasi goreng khas dengan bumbu rempah.", price: 25),
                MenuItem(image: "es-teh", name: "Es Teh Manis", description: "Teh manis segar dengan es batu.", price: 13)
            ]
        ),
        Product(
            image: "seblak",
            title: "Resto Sate Pakuan",
            price: 10,
            category: "Sundanese, BBQ, Indonesian",
            location: "GOP 1",
            menus: [
                MenuItem(image: "seblak", name: "Seblak Pedas", description: "Seblak dengan kuah pedas khas Bandung.", price: 50),
                MenuItem(image: "mie-goreng", name: "Mie Goreng Spesial", description: "Mie goreng dengan topping ayam dan telur.", price: 25),
                MenuItem(image: "nasi-goreng", name: "Nasi Goreng Kampung", description: "Nasi goreng khas dengan bumbu rempah.", price: 10),
                MenuItem(image: "es-teh", name: "Es Teh Manis", description: "Teh manis segar dengan es batu.", price: 13)
            ]
        ),
        Product(
            image: "seblak",
            title: "Nasi Goreng Kampung",
            price: 399,
            category: "Javanese, Street Food, Indonesian",
            location: "GOP 1",
            menus: [
                MenuItem(image: "seblak", name: "Seblak Pedas", description: "Seblak dengan kuah pedas khas Bandung.", price: 40),
                MenuItem(image: "mie-goreng", name: "Mie Goreng Spesial", description: "Mie goreng dengan topping ayam dan telur.", price: 48),
                MenuItem(image: "nasi-goreng", name: "Nasi Goreng Kampung", description: "Nasi goreng khas dengan bumbu rempah.", price: 56),
                MenuItem(image: "es-teh", name: "Es Teh Manis", description: "Teh manis segar dengan es batu.", price: 16)
            ]
        ),
        Product(
            image: "seblak",
            title: "Kedai Kopi Jowo",
            price: 499,
            category: "Javanese, Coffee, Indonesian",
            location: "GOP 1",
            menus: [
                MenuItem(image: "seblak", name: "Seblak Pedas", description: "Seblak dengan kuah pedas khas Bandung.", price: 40),
                MenuItem(image: "mie-goreng", name: "Mie Goreng Spesial", description: "Mie goreng dengan topping ayam dan telur.", price: 48),
                MenuItem(image: "nasi-goreng", name: "Nasi Goreng Kampung", description: "Nasi goreng khas dengan bumbu rempah.", price: 56),
                MenuItem(image: "es-teh", name: "Es Teh Manis", description: "Teh manis segar dengan es batu.", price: 16)
            ]
        )
    ]

    
    var body: some View {
        TabView {
            // Foods tab
            StallView(
                products: products,
                likedProductIDs: $likedProductIDs
            )
            .tabItem {
                Label("Foods", systemImage: "fork.knife")
            }

//            // Quest tab
//            QuestView()
//                .tabItem {
//                    Label("Quest", systemImage: "pencil.and.list.clipboard")
//                }

            // Favorites tab
            StallView(
                products: products.filter { likedProductIDs.contains($0.id) },
                likedProductIDs: $likedProductIDs
            )
            .tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
        }
    }
}

#Preview {
    ContentView()

}
