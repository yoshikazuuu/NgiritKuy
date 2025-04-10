//
//  StallCard.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 07/04/25.
//

import CoreLocation
import SwiftUI
import TipKit  // Import TipKit here

struct StallCard: View {
    let stall: Stall
    let isEligibleForTip: Bool
    let tipGroup: TipGroup

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var locationManager: LocationManager
    @State private var distance: String = "Calculating..."
    @State private var hasCalculatedDistance = false

    private let totalHorizontalPadding: CGFloat = 20 * 2
    private let imageHeight: CGFloat = 120

    var body: some View {
        VStack(alignment: .leading) {
            // --- Image Section ---
            ZStack(alignment: .topTrailing) {
                if let imageData = stall.image,
                    let uiImage = UIImage(data: imageData)
                {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: imageHeight)
                        .clipped()
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 12, style: .continuous))
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: imageHeight)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 12, style: .continuous)
                        )
                        .overlay {
                            Image(systemName: "fork.knife")
                                .font(.system(size: 30))
                                .foregroundStyle(.gray)
                        }
                }
            }
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(stall.name)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                    Spacer()
                    Button(action: {
                        stall.toggleFavorite()
                    }) {
                        Image(
                            systemName: stall.isFavorite
                                ? "heart.fill" : "heart"
                        )
                        .foregroundStyle(.red)
                    }
                    .sensoryFeedback(.increase, trigger: stall.isFavorite)
                    .popoverTip(
                        isEligibleForTip
                            ? (tipGroup.currentTip as? FavoriteTip) : nil,
                        arrowEdge: .bottom
                    )
                }
                
                HStack {
                    Image(systemName: "face.smiling.inverse")
                        .font(.caption)
                        .foregroundStyle(.orange)

                    Text("Get full for just \(Int(stall.minimumPrice))K")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                
                    HStack {
                        Image(systemName: "figure.walk")
                            .font(.caption)
                            .foregroundStyle(.orange)
                        Text(distance)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                
            }
            .padding(10)
        }
        .background(
            colorScheme == .dark
                ? Color(.secondarySystemBackground)
                : Color.white
        )
        .cornerRadius(12)
        .shadow(radius: 3)
        .popoverTip(
            isEligibleForTip ? (tipGroup.currentTip as? StallDetailTip) : nil,
            arrowEdge: .bottom
        )
        .onAppear {
            calculateDistance()
        }
        .onChange(of: locationManager.currentLocation) { _, newLocation in
            if newLocation != nil {
                calculateDistance()
            }
        }
    }

    private func calculateDistance() {
        // Use the injected locationManager
        guard let userLocation = locationManager.currentLocation else {
            // Handle case where location isn't available yet from shared manager
            if locationManager.authorizationStatus == .denied
                || locationManager.authorizationStatus == .restricted
            {
                distance = "Location denied"
            } else if locationManager.authorizationStatus == .notDetermined {
                distance = "Needs permission"
            } else {
                distance = "Waiting..."  // Or keep "Calculating..."
            }
            // Don't set hasCalculatedDistance = true here if location is missing
            return
        }

        guard let stallLocation = getStallLocation() else {
            distance = "No stall location"
            hasCalculatedDistance = true  // Mark as calculated (even if failed)
            return
        }

        // Use the shared locationManager's cache method
        let distanceString = locationManager.cachedDistance(
            for: stall.id,
            userLocation: userLocation,
            stallLocation: stallLocation
        )

        // Update UI on main thread
        // Use Task for async context if needed, but MainActor.run is often simpler here
        DispatchQueue.main.async {
            self.distance = distanceString
            self.hasCalculatedDistance = true  // Mark as calculated successfully
        }

        // --- Alternative using Task ---
        // Task { @MainActor in
        //     self.distance = distanceString
        //     self.hasCalculatedDistance = true
        // }
    }

    private func getStallLocation() -> CLLocation? {
        guard let area = stall.area,
            let latitude = area.latitude,
            let longitude = area.longitude
        else {
            print("⚠️ Missing location data for stall: \(stall.name)")
            return nil
        }

        guard
            CLLocationCoordinate2DIsValid(
                CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            )
        else {
            print(
                "⚠️ Invalid coordinates for stall: \(stall.name) - \(latitude), \(longitude)"
            )
            return nil
        }

        print("📍 Stall location found: \(latitude), \(longitude)")
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}
