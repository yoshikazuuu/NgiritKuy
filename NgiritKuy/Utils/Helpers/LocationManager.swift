//
//  LocationManager.swift
//  MakanMurah
//
//  Created by Jerry Febriano on 25/03/25.
//

import SwiftUI
import CoreLocation
import MapKit

// Update LocationManager with debouncing
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var currentLocation: CLLocation?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var locationError: String?
    
    // Distance caching
    private var distanceCache: [String: String] = [:]
    private var lastLocationUpdate = Date()
    private let updateThreshold: TimeInterval = 5 // Only update every 5 seconds
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.authorizationStatus = locationManager.authorizationStatus
        
        // Request permission right away
        self.requestLocationPermission()
    }
    
    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    // Handle authorization changes
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            print("📍 Location permission granted")
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            locationError = "Location access denied."
            print("📍 Location permission denied")
            currentLocation = nil
        case .notDetermined:
            locationError = "Location permission not determined."
            print("📍 Location permission not determined")
            currentLocation = nil
        @unknown default:
            locationError = "Unknown authorization status."
            print("📍 Unknown location permission status")
            currentLocation = nil
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let now = Date()
        // Check if enough time has passed OR if we don't have a location yet (for the first update)
        guard now.timeIntervalSince(lastLocationUpdate) >= updateThreshold || currentLocation == nil else {
            // Not enough time passed and we already have a location, skip update
            return
        }
        lastLocationUpdate = now // Update timestamp since we're proceeding

        // --- Get Last Location ---
        guard let newLocation = locations.last else {
            // No location data in the update array
            return
        }

        // --- Update on Main Thread ---
        // Dispatch the update of the @Published property to the main queue
        DispatchQueue.main.async { [weak self] in
            // Safely unwrap self
            guard let self = self else { return }

            // Assign the new location. This mutation on the main thread
            // will automatically trigger objectWillChange.send() because
            // currentLocation is @Published.
            self.currentLocation = newLocation

            // Optional: Add a print statement for debugging
             print("📍 Location updated on main thread: \(newLocation.coordinate)")

            // NO NEED for explicit self.objectWillChange.send() here
            // The assignment above handles publishing the change correctly.
        }
    }

    // Cache calculated distances to avoid recalculating constantly
    func cachedDistance(for stallId: UUID, userLocation: CLLocation, stallLocation: CLLocation) -> String {
        let cacheKey = "\(stallId.uuidString)-\(userLocation.coordinate.latitude.rounded(toPlaces: 5))-\(userLocation.coordinate.longitude.rounded(toPlaces: 5))"
        
        if let cached = distanceCache[cacheKey] {
            return cached
        }
        
        let distanceInMeters = userLocation.distance(from: stallLocation)
        let distanceString: String
        
        if distanceInMeters < 1000 {
            distanceString = "\(Int(distanceInMeters))m away"
        } else {
            let distanceInKm = distanceInMeters / 1000
            distanceString = String(format: "%.1f km away", distanceInKm)
        }
        
        // Cache the result
        distanceCache[cacheKey] = distanceString
        
        // Clear old cache entries if too many
        if distanceCache.count > 100 {
            distanceCache.removeAll()
        }
        
        return distanceString
    }
}

// Helper extension for rounding
extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
