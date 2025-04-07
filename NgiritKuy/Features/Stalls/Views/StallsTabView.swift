//
//  FoodView.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 04/04/25.
//

import SwiftData
import SwiftUI
import CoreLocation

struct StallView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var gameCenter = GameCenterManager.shared
    @Query private var stalls: [Stall]
    @Query private var areas: [GOPArea] // Assuming GOPArea is used elsewhere

    @State private var isShowingAchievement = false

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(stalls) { stall in
                        NavigationLink(destination: DetailStall(stall: stall)) {
                            StallCard(stall: stall)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("NgiritKuy")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if gameCenter.isAuthenticated {
                            isShowingAchievement = true
                        } else {
                            // Attempt authentication if not already authenticated
                            Task {
                                gameCenter.authenticatePlayer()
                                // Optionally check result and show sheet immediately
                                // if await gameCenter.authenticatePlayer() {
                                //     isShowingAchievement = true
                                // }
                            }
                        }
                    } label: {
                        Image(systemName: "star.fill")
                    }
                    // Optional: Disable button based on Game Center status
                    // .disabled(!gameCenter.isGameCenterEnabled)
                }
            }
            .sheet(isPresented: $isShowingAchievement) {
                GameCenterAchievementsView(isPresented: $isShowingAchievement)
                    .environmentObject(gameCenter) // Pass manager to the sheet
            }
        }
        // Optional: Attempt authentication when the view appears
        // .onAppear {
        //     if !gameCenter.isAuthenticated {
        //         Task {
        //             await gameCenter.authenticatePlayer()
        //         }
        //     }
        // }
    }
    
    private func calculateDistance(from userLocation: CLLocation, to stall: Stall) -> Double? {
        guard let stallArea = stall.area,
              let latitude = stallArea.latitude,
              let longitude = stallArea.longitude else {
            return nil
        }
        
        let stallLocation = CLLocation(latitude: latitude, longitude: longitude)
        return userLocation.distance(from: stallLocation)
    }
}
