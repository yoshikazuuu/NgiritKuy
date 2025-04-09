//
//  StallsGridView.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 09/04/25.
//

import SwiftUI
import TipKit

struct StallsGridView: View {
    let stalls: [Stall]
    let locationManager: LocationManager
    let stallTips: TipGroup
    let allStalls: [Stall]

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(stalls) { stall in
                    let isFirstStall = stall.id == allStalls.first?.id
                    NavigationLink(destination: DetailStall(stall: stall)) {
                        StallCard(
                            stall: stall,
                            isEligibleForTip: isFirstStall,
                            tipGroup: stallTips
                        )
                        .environmentObject(locationManager)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
    }
}
