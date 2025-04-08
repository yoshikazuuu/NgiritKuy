//
//  Stall.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 08/04/25.
//

extension Stall {
    func toggleFavorite() {
        self.isFavorite.toggle()
        AchievementTracker.shared.refreshMetrics()
    }
    
    func toggleVisited() {
        self.isVisited.toggle()
        AchievementTracker.shared.refreshMetrics()
    }
}
