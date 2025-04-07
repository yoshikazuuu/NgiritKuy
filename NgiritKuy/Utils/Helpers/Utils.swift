//
//  Utils.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 07/04/25.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
func seedData(_ context: ModelContext, _ seedData: [StallData]) {
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

        // --- Save deletions before inserting ---
        try context.save()
        print("Deletion changes saved.")

    } catch {
        print("Failed to delete existing data: \(error)")
        // Decide if you want to return here or proceed with seeding anyway
        return  // Or handle the error differently
    }

    // --- Start: Seeding new data ---
    print("Starting data seeding...")
    var stallsToInsert: [Stall] = []  // Keep track of stalls to insert

    for (name, desc, minPrice, maxPrice, avgPrice, area, imageName, menuItems)
        in seedData  // Or use allFoodCourtStalls if intended
    {
        // 1. Create the Stall object first
        let stall = Stall(
            name: name,
            desc: desc,
            minimumPrice: minPrice,
            maximumPrice: maxPrice,
            averagePrice: avgPrice,
            area: area,
            // menu: [], // Initialize menu here or rely on default []
            isFavorite: false,
            image: loadImage(named: imageName)
        )

        // 2. Create Menu objects and link them back to the stall
        var menusForThisStall: [FoodMenu] = []
        for (menuName, price, menuDesc, dietType, menuImageName, menuType)
            in menuItems
        {
            let menu = FoodMenu(
                name: menuName,
                price: price,
                desc: menuDesc,
                image: loadImage(named: menuImageName),
                type: ["Main"],  // Assuming always "Main" for now
                dietType: dietType,
                menuType: menuType,
                stall: stall  // Link menu back to the stall
            )
            menusForThisStall.append(menu)
        }

        // 3. Assign the created menus to the stall's relationship property
        stall.menu = menusForThisStall

        // 4. Add the fully configured stall to our list
        stallsToInsert.append(stall)
    }

    // 5. Insert ONLY the Stall objects into the context.
    // SwiftData will handle inserting the related FoodMenu objects
    // because of the relationship definition and cascade rule.
    print(
        "Inserting \(stallsToInsert.count) stalls (menus will be cascaded)...")
    for stall in stallsToInsert {
        context.insert(stall)
        // DO NOT insert menu items explicitly here:
        // for menu in stall.menu {
        //     context.insert(menu) // REMOVED THIS LINE
        // }
    }

    // 6. Save all insertions
    do {
        try context.save()
        print("Data seeded successfully.")
    } catch {
        // If it still fails, the error might give more clues
        print("Failed to save seeded data: \(error)")
        // Consider logging the full error details
        // print(error.localizedDescription)
        // if let swiftDataError = error as? SwiftData.SwiftDataError {
        //     // Explore specific SwiftData error details if available
        // }
    }
}

// loadImage function remains the same
func loadImage(named imageName: String) -> Data? {
    guard let image = UIImage(named: imageName) else {
        // It's helpful to know *which* image failed if seeding fails later
        print("Warning: Image named '\(imageName)' not found in asset catalog.")
        return nil
    }
    return image.pngData()
}
