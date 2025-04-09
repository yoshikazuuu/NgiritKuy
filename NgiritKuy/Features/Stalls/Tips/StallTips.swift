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
    var image: Image? { Image(systemName: "trophy.circle.fill") }
    var options: [Option] { MaxDisplayCount(1) }
}

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

struct FavoriteTip: Tip {
    var title: Text { Text("Add to Favorites") }
    var message: Text? {
        Text("Tap the heart to save this stall to your favorites list.")
    }
    var image: Image? { Image(systemName: "heart.circle.fill") }
    var options: [Option] { MaxDisplayCount(1) }
}

struct FilterTip: Tip {
    var title: Text { Text("Filter Stalls") }
    var message: Text? {
        Text("Use the filter button to narrow down your search for stalls.")
    }
    var image: Image? { Image(systemName: "line.horizontal.3.decrease.circle.fill") }
    var options: [Option] { MaxDisplayCount(1) }
}
