//
//  Utils.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 07/04/25.
//

import SwiftData
import Foundation
import SwiftUI

@MainActor
func seedData(_ context: ModelContext) async {
    // Check if data already exists (optional, but good practice)
    let stallCount = try? context.fetchCount(FetchDescriptor<Stall>())
    if (stallCount ?? 0) > 0 {
        print("Data already seeded, skipping.")
        return
    }
    
    var stalls: [Stall] = []
    
    
    for (name, desc, minPrice, maxPrice, avgPrice, area, imageName, menuItems) in allFoodCourtStalls {
        let stall = Stall(
            name: name,
            desc: desc,
            minimumPrice: minPrice,
            maximumPrice: maxPrice,
            averagePrice: avgPrice,
            area: area,
            menu: [],
            isFavorite: false,
            image: loadImage(named: imageName) // Load stall image
        )
        
        var menus: [FoodMenu] = []
        for (menuName, price, menuDesc, dietType, imageName, menuType) in menuItems {
            let menu = FoodMenu(
                name: menuName,
                price: price,
                desc: menuDesc,
                image: loadImage(named: imageName),
                type: ["Main"],
                dietType: dietType,
                menuType: menuType,
                stall: stall
            )
            menus.append(menu)
        }
        
        stall.menu = menus // Establish relationship
        stalls.append(stall)
    }
    
    // Insert all stalls and their menus into the context
    for stall in stalls {
        context.insert(stall)
        for menu in stall.menu {
            context.insert(menu)
        }
    }
    
    do {
        try context.save()
        print("Data seeded successfully.")
    } catch {
        print("Failed to seed data: \(error)")
    }
}

func loadImage(named imageName: String) -> Data? {
    guard let image = UIImage(named: imageName) else {
        print("Image named \(imageName) not found.")
        return nil
    }
    return image.pngData()
}
