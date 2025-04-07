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
    // --- Start: Delete existing data ---
    do {
        print("Attempting to delete existing data...")
        // Fetch and delete all existing FoodMenu items first (due to potential relationships)
        let existingMenus = try context.fetch(FetchDescriptor<FoodMenu>())
        if !existingMenus.isEmpty {
            for menu in existingMenus {
                context.delete(menu)
            }
            print("\(existingMenus.count) existing FoodMenu items deleted.")
        } else {
            print("No existing FoodMenu items found to delete.")
        }

        // Fetch and delete all existing Stall items
        let existingStalls = try context.fetch(FetchDescriptor<Stall>())
        if !existingStalls.isEmpty {
            for stall in existingStalls {
                context.delete(stall)
            }
            print("\(existingStalls.count) existing Stall items deleted.")
        } else {
            print("No existing Stall items found to delete.")
        }

        // Try saving the deletions immediately (optional, but can help isolate issues)
        // try context.save()
        // print("Deletion changes saved.")

    } catch {
        print("Failed to delete existing data: \(error)")
        // Decide if you want to return here or proceed with seeding anyway
        return // Or handle the error differently
    }
    // --- End: Delete existing data ---

    // --- Start: Seed new data ---
    print("Starting data seeding...")
    var stalls: [Stall] = []

    // Assuming allFoodCourtStalls is defined elsewhere like before
    // let allFoodCourtStalls: [(String, String, Int, Int, Int, String, String, [(String, Int, String, [String], String, String)])] = [...]

    for (name, desc, minPrice, maxPrice, avgPrice, area, imageName, menuItems) in allFoodCourtStalls {
        let stall = Stall(
            name: name,
            desc: desc,
            minimumPrice: minPrice,
            maximumPrice: maxPrice,
            averagePrice: avgPrice,
            area: area,
            menu: [], // Initialize empty, will be populated below
            isFavorite: false,
            image: loadImage(named: imageName) // Load stall image
        )

        var menus: [FoodMenu] = []
        for (menuName, price, menuDesc, dietType, menuImageName, menuType) in menuItems {
            let menu = FoodMenu(
                name: menuName,
                price: price,
                desc: menuDesc,
                image: loadImage(named: menuImageName), // Use menu specific image name
                type: ["Main"], // Example type, adjust as needed
                dietType: dietType,
                menuType: menuType,
                stall: stall // Establish relationship back to stall
            )
            menus.append(menu)
        }

        stall.menu = menus // Assign the created menus to the stall
        stalls.append(stall)
    }

    // Insert all new stalls and their menus into the context
    // Note: SwiftData automatically handles inserting related models
    // when the parent model (Stall with its menu array) is inserted.
    // Explicitly inserting menus might not be necessary if the relationship
    // is correctly set up, but doing both is safe.
    for stall in stalls {
        context.insert(stall)
        // You might not need the inner loop if inserting the stall cascades
        // to its related menu items. Test to confirm behavior.
        // for menu in stall.menu {
        //     context.insert(menu)
        // }
    }
    // --- End: Seed new data ---

    // Save all changes (deletions and insertions)
    do {
        try context.save()
        print("Data seeded successfully.")
    } catch {
        print("Failed to save seeded data: \(error)")
    }
}

func loadImage(named imageName: String) -> Data? {
    guard let image = UIImage(named: imageName) else {
        // It's helpful to know *which* asset catalog is being searched
        // print("Image named '\(imageName)' not found in asset catalog.")
        return nil
    }
    return image.pngData()
}
