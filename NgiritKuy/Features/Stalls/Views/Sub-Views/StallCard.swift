//
//  StallCard.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 07/04/25.
//

import SwiftUI
import CoreLocation

struct StallCard: View {
    let stall: Stall
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.modelContext) private var modelContext
    @StateObject private var locationManager = LocationManager()
    @State private var distance: String = "Calculating..."

    // Calculate the width of the image
    private let totalHorizontalPadding: CGFloat = 20 * 2
    private let imageHeight: CGFloat = 120

    var body: some View {
        VStack(alignment: .leading) {
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

            VStack(alignment: .leading) {
                HStack {
                    Text(stall.name)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                    Spacer()
                    Button(action: {
                        stall.isFavorite.toggle()
                        AchievementTracker.shared.updateAchievements(context: modelContext)
                    }) {
                        Image(
                            systemName: stall.isFavorite
                                ? "heart.fill" : "heart"
                        )
                        .foregroundStyle(.red)
                    }
                    .sensoryFeedback(.success, trigger: stall.isFavorite)

                }
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "location.fill")
                            .font(.caption)
                            .foregroundStyle(.orange)
                        Text(distance)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
                Text("Harga mulai Rp\(Int(stall.averagePrice)).000")
                    .font(.caption)
                    .foregroundColor(.gray)
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
        .onAppear {
            print("📌 Stall location: \(stall.area?.latitude ?? 0), \(stall.area?.longitude ?? 0)")
            locationManager.startUpdatingLocation()
            calculateDistance()
        }
        .onChange(of: locationManager.currentLocation) { _, newLocation in
            if newLocation != nil {
                calculateDistance()
            }
        }
    }
    
    private func calculateDistance() {
        guard let userLocation = locationManager.currentLocation else {
            distance = "Waiting for location"
            return
        }
        
        guard let stallLocation = getStallLocation() else {
            distance = "No stall location"
            return
        }
        
        let distanceInMeters = userLocation.distance(from: stallLocation)
        
        if distanceInMeters < 1000 {
            distance = "\(Int(distanceInMeters))m away"
        } else {
            let distanceInKm = distanceInMeters / 1000
            distance = String(format: "%.1f km away", distanceInKm)
        }
    }
    
    private func getStallLocation() -> CLLocation? {
        guard let area = stall.area,
              let latitude = area.latitude,
              let longitude = area.longitude else {
            print("⚠️ Missing location data for stall: \(stall.name)")
            return nil
        }
        
        // Ensure the coordinates are valid
        guard CLLocationCoordinate2DIsValid(CLLocationCoordinate2D(latitude: latitude, longitude: longitude)) else {
            print("⚠️ Invalid coordinates for stall: \(stall.name) - \(latitude), \(longitude)")
            return nil
        }
        
        print("📍 Stall location found: \(latitude), \(longitude)")
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}
