//
//  ContentView.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 07/04/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @StateObject private var gameCenter = GameCenterManager.shared

    var body: some View {
        TabView {
            StallsTabView()
                .tabItem {
                    Label("Stalls", systemImage: "fork.knife")
                }
            
            FavoriteTabView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
            
        }
        .onAppear {
            // Authenticate to use game center
            gameCenter.authenticatePlayer()
        }
    }
}

#Preview {
    ContentView()
}
