//
//  FoodMenu.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 08/04/25.
//

extension FoodMenu {
    func toggleFavorite() {
        self.isFavorite.toggle()
        AchievementTracker.shared.refreshMetrics()
    }
}
