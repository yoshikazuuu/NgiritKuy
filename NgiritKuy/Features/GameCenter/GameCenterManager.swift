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
    @Published var achievements: [GKAchievement] = [] // Consider loading these if needed

    private let authPersistenceKey = "hasAuthenticatedWithGameCenter"

    private init() { // Make init private for singleton
        // Check persistence on init
        attemptSilentAuthenticationIfPreviouslyAuthenticated()
    }

    // Call this early in the app lifecycle or on init
    func attemptSilentAuthenticationIfPreviouslyAuthenticated() {
        if UserDefaults.standard.bool(forKey: authPersistenceKey) {
            print("🔑 Game Center: Previously authenticated, attempting silent login...")
            authenticatePlayer(silent: true)
        } else {
            print("🔑 Game Center: No previous authentication recorded.")
        }
    }

    // Main authentication function
    func authenticatePlayer(silent: Bool = false) {
        let localPlayer = GKLocalPlayer.local

        // Check if already authenticated
        if localPlayer.isAuthenticated {
            print("🔑 Game Center: Player already authenticated.")
            DispatchQueue.main.async {
                self.isAuthenticated = true
                // Ensure persistence flag is set
                UserDefaults.standard.set(true, forKey: self.authPersistenceKey)
            }
            return
        }

        // Proceed with authentication handler
        localPlayer.authenticateHandler = { [weak self] viewController, error in
            guard let self = self else { return }

            DispatchQueue.main.async { // Ensure all updates happen on main thread
                if let vc = viewController {
                    if !silent {
                        print("🔑 Game Center: Authentication requires UI. Presenting VC...")
                        self.presentAuthenticationVC(vc)
                    } else {
                        // Silent authentication failed because it needs UI.
                        // Don't change isAuthenticated state here, let it remain false.
                        print("🔑 Game Center: Silent authentication failed (UI required).")
                        // Optional: Clear the persistence key if silent fails?
                        // UserDefaults.standard.set(false, forKey: self.authPersistenceKey)
                    }
                } else if localPlayer.isAuthenticated {
                    self.isAuthenticated = true
                    UserDefaults.standard.set(true, forKey: self.authPersistenceKey) // Persist success
                    print("✅ Game Center: Player authenticated successfully (Silent: \(silent)).")
                    // Trigger achievement refresh *after* successful authentication
                    AchievementTracker.shared.refreshMetrics()
                } else {
                    self.isAuthenticated = false
                    // Don't necessarily clear the key on cancel/error,
                    // maybe they'll try again later. Only clear on explicit sign out.
                    // UserDefaults.standard.set(false, forKey: self.authPersistenceKey)
                    if let error = error {
                        print("❌ Game Center: Authentication error: \(error.localizedDescription)")
                    } else {
                        print("⚠️ Game Center: Authentication cancelled or failed (no error).")
                    }
                }
            }
        }
    }

    // Helper to find and present the Game Center VC
    private func presentAuthenticationVC(_ viewController: UIViewController) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let window = windowScene.windows.first(where: { $0.isKeyWindow }),
            let rootViewController = window.rootViewController
        else {
            print("❌ Game Center: Could not find key window or root view controller.")
            return
        }

        // Find the topmost view controller to present from
        var topController = rootViewController
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }

        // Check if already presenting something (like another Game Center VC)
        if topController.presentedViewController == nil {
             topController.present(viewController, animated: true, completion: nil)
        } else {
             print("⚠️ Game Center: Another view controller is already presented. Skipping presentation.")
        }
    }

    /// Report an achievement using GKAchievement.
    func reportAchievement(identifier: String, percentComplete: Double) {
        // Ensure authenticated before reporting
        guard isAuthenticated else {
            // print("⚠️ Game Center: Cannot report achievement. Not authenticated.")
            return
        }

        let achievement = GKAchievement(identifier: identifier)
        // Ensure percent is clamped between 0 and 100
        achievement.percentComplete = max(0.0, min(100.0, percentComplete))
        // Show banner only for 100% completion? Or always? Set true for now.
        achievement.showsCompletionBanner = true

        GKAchievement.report([achievement]) { error in
            if let error = error {
                print(
                    "❌ Error reporting achievement '\(identifier)': \(error.localizedDescription)"
                )
            } else {
                // Don't log success for every report, can be noisy.
                // Only log if percentComplete is 100?
                if achievement.percentComplete >= 100.0 {
                     print("✅ Achievement '\(identifier)' reported as complete!")
                }
            }
        }
    }

    // Reset achievements for testing purpose
    func resetAchievements() {
        guard isAuthenticated else {
            print("⚠️ Game Center: Cannot reset achievements. Not authenticated.")
            return
        }
        GKAchievement.resetAchievements { error in
            if let error = error {
                print("❌ Error resetting achievements: \(error.localizedDescription)")
            } else {
                print("✅ Game Center: Achievements reset successfully!")
                // Also clear local progress after resetting
                Task { @MainActor in
                    if let progress = AchievementTracker.shared.userProgress {
                        progress.completedAchievements.removeAll()
                        // Optionally reset other progress metrics here if desired
                        // progress.favoriteStallCount = 0
                        // ... etc ...
                        AchievementTracker.shared.refreshMetrics() // Refresh to update state
                    }
                }
            }
        }
    }

    // Optional: Add a sign out method
    func signOut() {
        DispatchQueue.main.async {
            self.isAuthenticated = false
            UserDefaults.standard.set(false, forKey: self.authPersistenceKey) // Clear persistence
            print("🔑 Game Center: User signed out (local state cleared).")
            // Note: This doesn't sign the user out of the Game Center app itself.
        }
    }
}
