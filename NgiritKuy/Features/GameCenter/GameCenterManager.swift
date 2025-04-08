//
//  GameCenterManager.swift
//  NgiritKuy
//
//  Created by Ivan Setiawan on 27/03/25.
//


import SwiftUI
import GameKit

class GameCenterManager: ObservableObject {
    static let shared = GameCenterManager()
    
    @Published var isAuthenticated = false
    @Published var achievements: [GKAchievement] = []
    
    init() {
        authenticatePlayer()
    }
    
    func authenticatePlayer() {
        let localPlayer = GKLocalPlayer.local
        localPlayer.authenticateHandler = { viewController, error in
            if let viewController = viewController {
                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let window = scene.windows.first {
                    window.rootViewController?.present(viewController, animated: true)
                }
            } else if localPlayer.isAuthenticated {
                self.isAuthenticated = true
                print("Player authenticated")
                self.loadAchievements()  // Optionally load achievements on auth
            } else {
                self.isAuthenticated = false
                if let error = error {
                    print("Authentication error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    /// Report an achievement using GKAchievement.
    func reportAchievement(identifier: String, percentComplete: Double) {
        let achievement = GKAchievement(identifier: identifier)
        achievement.percentComplete = percentComplete
        achievement.showsCompletionBanner = true

        GKAchievement.report([achievement]) { error in
            if let error = error {
                print("Error reporting achievement: \(error.localizedDescription)")
            } else {
                print("Achievement \(identifier) reported successfully!")
                self.loadAchievements() // Refresh achievements list if needed
            }
        }
    }
    
    /// Load all achievements for the local player.
    func loadAchievements() {
        GKAchievement.loadAchievements { achievements, error in
            if let error = error {
                print("Error loading achievements: \(error.localizedDescription)")
            } else if let achievements = achievements {
                DispatchQueue.main.async {
                    self.achievements = achievements
                    print("Loaded achievements: \(achievements)")
                }
            }
        }
    }
    
    // reset achievements for testing
    func resetAchievements() {
        GKAchievement.resetAchievements { error in
            if let error = error {
                print("Error resetting achievements: \(error.localizedDescription)")
            } else {
                print("Achievements reset successfully!")
                self.loadAchievements() // Refresh achievements list after reset
            }
        }
    }
}
