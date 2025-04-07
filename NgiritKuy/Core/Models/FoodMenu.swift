//
//  FoodMenu.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 07/04/25.
//


import SwiftData
import SwiftUI

@Model
final class FoodMenu {
    @Attribute(.unique) var id: UUID = UUID()
    var name: String
    var price: Double
    var desc: String
    var image: Data?
    var type: [String]
    var dietType: String
    var menuType: MenuType
    var stall: Stall?
    var isFavorite: Bool = false
    
    init(
        id: UUID = UUID(),
        name: String,
        price: Double,
        desc: String,
        image: Data? = nil,
        type: [String],
        dietType: String,
        menuType: MenuType,
        stall: Stall? = nil,
        isFavorite: Bool = false
    ) {
        self.id = id
        self.name = name
        self.price = price
        self.desc = desc
        self.image = image
        self.type = type
        self.dietType = dietType
        self.menuType = menuType
        self.stall = stall
        self.isFavorite = isFavorite
    }
}

enum MenuType: String, CaseIterable, Codable {
    case indonesian = "Indonesian"
    case western = "Western"
    case chinese = "Chinese"
    case japanese = "Japanese"
    case korean = "Korean"
    case javanese = "Javanese"
    case sundanese = "Sundanese"
}
