//
//  locationServices.swift
//  proxycaller-ai
//
//  Created by Philip Daquin on 14/5/2024.
//

import Foundation
import CoreLocation


class LocationServices: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published 
    var location: CLLocationCoordinate2D?
    
    @Published
    var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func getCurrentLocation() {
        self.isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.first?.coordinate
        self.isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error getting location", error)
        self.isLoading = false
    }
}
