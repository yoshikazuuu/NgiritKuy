//
//  StallData.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 07/04/25.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let price: Double
    let category: String
    let location: String
    let menus: [MenuItem]
    
    // Compute price summary
    var minPrice: Double {
        menus.map { $0.price }.min() ?? 0
    }
    
    var maxPrice: Double {
        menus.map { $0.price }.max() ?? 0
    }
    
    var avgPrice: Double {
        let prices = menus.map { $0.price }
        return prices.isEmpty ? 0 : prices.reduce(0, +) / Double(prices.count)
    }
}

struct MenuItem: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let description: String
    let price: Double
}
