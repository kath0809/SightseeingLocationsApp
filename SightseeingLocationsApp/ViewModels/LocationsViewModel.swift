//
//  LocationsViewModel.swift
//  SightseeingLocationsApp
//
//  Created by Karima Thingvold on 12/09/2024.
//

import Foundation
import MapKit
import _MapKit_SwiftUI

class LocationsViewModel: ObservableObject {
    
    /// All loaded locations
    @Published var locations: [Location]
    
    // Maps current location
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var cameraPosition: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion())
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        let region = MKCoordinateRegion(
                    center: location.coordinates,
                    span: mapSpan)
                
                // Update to MapCameraPosition
                cameraPosition = .region(region)
        }
    }
