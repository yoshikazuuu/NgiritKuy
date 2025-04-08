//
//  FilterButton.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 08/04/25.
//

import SwiftUI

struct FilterPillButton: View {
    let title: String
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .frame(height: 20)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(isActive ? Color.accent.opacity(0.1) : Color(.systemGray6))
                .foregroundStyle(isActive ? .accent : .primary)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(isActive ? Color.accent : Color.clear, lineWidth: 1)
                )
        }
    }
}
