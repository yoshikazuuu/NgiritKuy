//
//  GOPArea.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 07/04/25.
//

import CoreLocation
import SwiftData

@Model
final class GOPArea {
    @Attribute(.unique) var id: UUID = UUID()
    var name: String
    var latitude: Double?
    var longitude: Double?

    init(
        name: String,
        latitude: Double? = nil,
        longitude: Double? = nil,
        id: UUID = UUID()
    ) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }

    var location2D: CLLocationCoordinate2D? {
        guard let lat = latitude, let lon = longitude else {
            return nil
        }
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}

// Extension with sample data
extension GOPArea {
    static let gop9 = GOPArea(
        name: "GOP 9 - GreenEatery",
        latitude: -6.302076845564232,
        longitude:
            106.65254323734639)
    static let foodcourt = GOPArea(
        name: "FoodCourt The Breeze",
        latitude: -6.301573260233978,
        longitude:
            106.65515741106492)
    static let gop1 = GOPArea(
        name: "GOP 1 - Dapur Kencana",
        latitude: -6.301626324047729,
        longitude: 106.650302571158)

    static let all: [GOPArea] = [gop1, gop9, foodcourt]
}
