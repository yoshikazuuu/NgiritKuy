//
//  UserProgress.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 08/04/25.
//

import SwiftData
import Foundation

@Model
final class UserProgress {
    @Attribute(.unique) var id: UUID = UUID()
    
    // Achievement metrics
    var favoriteStallCount: Int = 0
    var visitedStallCount: Int = 0
    var distinctAreasVisited: Set<UUID> = []
    var favoriteMenuCount: Int = 0
    var favoriteFoodsUnder10k: Int = 0
    var locateCount: Int = 0
    var maxFavoritesInSingleArea: Int = 0
    var maxFavoriteMenusInStall: Int = 0
    var lastUpdated: Date = Date()
    
    // Track completed achievements to avoid recalculating
    var completedAchievements: [String] = []
    
    init(
        id: UUID = UUID(),
        favoriteStallCount: Int = 0,
        visitedStallCount: Int = 0,
        distinctAreasVisited: Set<UUID> = [],
        favoriteMenuCount: Int = 0,
        favoriteFoodsUnder10k: Int = 0,
        locateCount: Int = 0,
        maxFavoritesInSingleArea: Int = 0,
        maxFavoriteMenusInStall: Int = 0,
        lastUpdated: Date = Date(),
        completedAchievements: [String] = []
    ) {
        self.id = id
        self.favoriteStallCount = favoriteStallCount
        self.visitedStallCount = visitedStallCount
        self.distinctAreasVisited = distinctAreasVisited
        self.favoriteMenuCount = favoriteMenuCount
        self.favoriteFoodsUnder10k = favoriteFoodsUnder10k
        self.locateCount = locateCount
        self.maxFavoritesInSingleArea = maxFavoritesInSingleArea
        self.maxFavoriteMenusInStall = maxFavoriteMenusInStall
        self.lastUpdated = lastUpdated
        self.completedAchievements = completedAchievements
    }
}
