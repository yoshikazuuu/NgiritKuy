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
        // Only update if sufficient time has passed
        let now = Date()
        if now.timeIntervalSince(lastLocationUpdate) < updateThreshold, currentLocation != nil {
            return
        }
        
        lastLocationUpdate = now
        
        if let location = locations.last {
            // Update on a background thread to avoid UI stuttering
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                self?.currentLocation = location
                DispatchQueue.main.async {
                    // Publish the changes on main thread after the work is done
                    self?.objectWillChange.send()
                }
            }
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
