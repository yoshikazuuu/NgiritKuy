//
//  EmptyStateView.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 09/04/25.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 50))
                .foregroundColor(Color.secondary.opacity(0.6))
                .padding(.bottom, 10)
            Text("No food stalls found.")
                .font(.title3)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 50)
    }
}
