//
//  ContentView.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 26/03/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Foods tab
            StallView()
                .tabItem {
                    Label("Foods", systemImage: "fork.knife")
                }

            // Favorites tab
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}
