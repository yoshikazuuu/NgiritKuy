//
//  GameCenterAchievementsView.swift
//  NgiritKuy
//
//  Created by Ivan Setiawan on 06/04/25.
//

import SwiftUI
import GameKit

struct GameCenterAchievementsView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    
    func makeUIViewController(context: Context) -> GKGameCenterViewController {
        let viewController = GKGameCenterViewController(state: .achievements)
        viewController.gameCenterDelegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: GKGameCenterViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, GKGameCenterControllerDelegate {
        var parent: GameCenterAchievementsView
        
        init(_ parent: GameCenterAchievementsView) {
            self.parent = parent
        }
        
        func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
            gameCenterViewController.dismiss(animated: true)
            parent.isPresented = false
        }
    }
}
