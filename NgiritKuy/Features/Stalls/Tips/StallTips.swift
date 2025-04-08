//
//  StallTips.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 08/04/25.
//

import TipKit

struct AchievementTip: Tip {
    var title: Text { Text("View Achievements") }
    var message: Text? {
        Text("Tap the star to check your progress and access Game Center.")
    }
    var image: Image? { Image(systemName: "star.fill") }
    var options: [Option] { MaxDisplayCount(1) }
}

// Tip for the Stall Card (Second Tip)
struct StallDetailTip: Tip {
    var title: Text { Text("Stall Details") }
    var message: Text? {
        Text(
            "Tap on a stall card to see more details like its menu, location, and reviews."
        )
    }
    var image: Image? { Image(systemName: "info.circle.fill") }
    var options: [Option] { MaxDisplayCount(1) }
}

// Tip for the Favorite Button (Third Tip)
struct FavoriteTip: Tip {
    var title: Text { Text("Add to Favorites") }
    var message: Text? {
        Text("Tap the heart to save this stall to your favorites list.")
    }
    var image: Image? { Image(systemName: "heart.fill") }
    var options: [Option] { MaxDisplayCount(1) }
}
