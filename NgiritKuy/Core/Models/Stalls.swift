//
//  Stalls.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 07/04/25.
//

import CoreLocation
import SwiftData

@Model
final class Stall {
    @Attribute(.unique) var id: UUID = UUID()
    var name: String
    var desc: String
    var minimumPrice: Double
    var maximumPrice: Double
    var averagePrice: Double
    @Relationship var area: GOPArea?
    @Relationship(deleteRule: .cascade, inverse: \FoodMenu.stall) var menu:
        [FoodMenu] = []
    var isFavorite: Bool = false
    var isVisited: Bool = false
    var image: Data?

    init(
        name: String,
        desc: String,
        minimumPrice: Double,
        maximumPrice: Double,
        averagePrice: Double,
        area: GOPArea? = nil,
        menu: [FoodMenu] = [],
        isFavorite: Bool = false,
        isVisited: Bool = false,
        image: Data? = nil,
        id: UUID = UUID()
    ) {
        self.id = id
        self.name = name
        self.desc = desc
        self.minimumPrice = minimumPrice
        self.maximumPrice = maximumPrice
        self.averagePrice = averagePrice
        self.area = area
        self.menu = menu
        self.isFavorite = isFavorite
        self.isVisited = isVisited
        self.image = image
    }
}

extension Stall {
    var latitude: Double? {
        get { area?.latitude }
        set { area?.latitude = newValue ?? 0 }
    }

    var longitude: Double? {
        get { area?.longitude }
        set { area?.longitude = newValue ?? 0 }
    }
}
