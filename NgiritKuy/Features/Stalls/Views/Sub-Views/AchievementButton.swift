//
//  AchievementButton.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 09/04/25.
//

import SwiftUI
import TipKit

struct AchievementButton: View {
    @ObservedObject var gameCenter: GameCenterManager
    @Binding var isShowingAchievement: Bool
    var tip: AchievementTip?
    
    var body: some View {
        Button(action: {
            if gameCenter.isAuthenticated {
                isShowingAchievement = true
            } else {
                Task { gameCenter.authenticatePlayer() }
            }
        }) {
            Image(systemName: "star.fill")
        }
        .popoverTip(tip, arrowEdge: .top)
    }
}
