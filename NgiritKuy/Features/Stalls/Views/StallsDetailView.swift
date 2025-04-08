//
//  StallsDetailView.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 07/04/25.
//

import SwiftUI
import MapKit

struct DetailStall: View {
    let stall: Stall
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // Stall Image
                if let imageData = stall.image,
                    let uiImage = UIImage(data: imageData)
                {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(5 / 4, contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .clipped()
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .aspectRatio(5 / 4, contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .overlay {
                            Image(systemName: "photo")
                                .font(.system(size: 50))
                                .foregroundStyle(.gray)
                        }
                }

                // Stall Info
                VStack(alignment: .leading, spacing: 5) {
                    Text(stall.name)
                        .font(.title)
                        .fontWeight(.bold)

                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundStyle(.red)
                        Text(stall.area?.name ?? "Unknown area")
                            .font(.subheadline)
                    }

                    Text(stall.desc)
                        .font(.footnote)
                        .foregroundColor(.gray)

                }
                .padding()

                // Price info
                VStack(alignment: .leading, spacing: 8) {
                    Text("Price")
                        .font(.headline)

                    HStack(spacing: 16) {
                        PriceTag(
                            label: "Min", price: stall.minimumPrice,
                            color: .green)

                        PriceTag(
                            label: "Avg", price: stall.averagePrice,
                            color: .blue)

                        PriceTag(
                            label: "Max", price: stall.maximumPrice,
                            color: .orange)

                    }
                }
                .padding(.horizontal)

                Divider()

                VStack(spacing: 8) {
                    Button(action: {
                        stall.isVisited.toggle()
                        AchievementTracker.shared.updateAchievements(
                            context: modelContext)
                    }) {
                        HStack {
                            Image(
                                systemName: stall.isVisited
                                    ? "checkmark.circle.fill"
                                    : "checkmark.circle"
                            )
                            Text(
                                stall.isVisited ? "Visited" : "Mark as Visited"
                            )
                            .fontWeight(.medium)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(stall.isVisited ? Color.green : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .sensoryFeedback(.success, trigger: stall.isVisited)

                    Button(action: {
                        AchievementTracker.shared.didUseLocate()
                        AchievementTracker.shared.updateAchievements(
                            context: modelContext)

                        // Open Apple Maps with walking directions from your current location
                        guard let area = stall.area,
                            let latitude = area.latitude,
                            let longitude = area.longitude
                        else {
                            print("Stall has no location data.")
                            return
                        }

                        let destinationCoordinate = CLLocationCoordinate2D(
                            latitude: latitude,
                            longitude: longitude)
                        let destinationPlacemark = MKPlacemark(
                            coordinate: destinationCoordinate)
                        let destinationMapItem = MKMapItem(
                            placemark: destinationPlacemark)
                        destinationMapItem.name = stall.name

                        // Use MKMapItem.forCurrentLocation() to let Maps use your current location.
                        let sourceMapItem = MKMapItem.forCurrentLocation()
                        let launchOptions = [
                            MKLaunchOptionsDirectionsModeKey:
                                MKLaunchOptionsDirectionsModeWalking
                        ]

                        MKMapItem.openMaps(
                            with: [sourceMapItem, destinationMapItem],
                            launchOptions: launchOptions)

                    }) {
                        HStack {
                            Image(systemName: "location.fill")
                            Text("Locate Me")
                                .fontWeight(.medium)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue)
                        )
                    }
                    .padding(.horizontal)
                }

                Divider()

                // Menu Section
                Text("Menu")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                ForEach(
                    sortedMenu
                ) { menu in
                    MenuItemRow(menu: menu) {
                        toggleFavorite(for: menu.id)
                    }
                    .padding(.bottom, 2)  // Add small spacing between rows
                }

            }
        }
        .navigationTitle(stall.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    // Computed property for the sorted menu.
    private var sortedMenu: [FoodMenu] {
        stall.menu.sorted { item1, item2 in
            if item1.isFavorite != item2.isFavorite {
                return item1.isFavorite
            } else {
                return item1.price < item2.price
            }
        }
    }

    // Function to toggle the favorite status for a specific menu item
    private func toggleFavorite(for menuID: UUID) {
        // Find the index of the menu item within the original stall.menu array
        if let index = stall.menu.firstIndex(where: { $0.id == menuID }) {
            // Perform the state change that triggers the UI update
            // Wrap the state change in withAnimation
            withAnimation(.spring()) {  // Use .default or customize (e.g., .spring())
                stall.menu[index].isFavorite.toggle()
                // The @Binding automatically propagates this change back to the parent's state
                // The .animation modifier on ForEach observes the change in `sortedMenu`
                // caused by this state update and animates the transition.
            }
            AchievementTracker.shared.updateAchievements(context: modelContext)
        }
    }
}
