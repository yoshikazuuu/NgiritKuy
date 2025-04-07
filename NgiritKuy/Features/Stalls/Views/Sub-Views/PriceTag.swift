//
//  PriceTag.swift
//  MakanMurah
//
//  Created by Jerry Febriano on 20/03/25.
//

import SwiftUI

struct PriceTag: View {
    let label: String
    let price: Double
    let color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            Text(label)
                .font(.caption)
//                .foregroundStyle(.secondary)
            
            
            HStack {
                Spacer()
                Text("Rp\(price, specifier: "%.0f").000")
                    .font(.subheadline)
                    .fontWeight(.semibold)
//                    .foregroundStyle(color)
                Spacer()
            }
        }
        .padding(8)
//        .background(color.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

