//
//  AchievementAuthView.swift
//  NgiritKuy
//
//  Created by Ivan Setiawan on 09/04/25.
//

import SwiftUI

struct AchievementAuthView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var gameCenter = GameCenterManager.shared

    var body: some View {

        NavigationStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image("gamecenter.logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 60)
                    Spacer()
                    Text(
                        "Embark on a journey to track your achievements using Game Center!"
                    )
                    .font(.headline)
                    Spacer()
                }
                .padding()
                Button("Sign in with Game Center") {
                    if !gameCenter.isAuthenticated {
                        gameCenter.authenticatePlayer()

                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Game Center Achievement")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AchievementAuthView()
}
