    //
    //  LocationsViewModel.swift
    //  SightseeingLocationsApp
    //
    //  Created by Karima Thingvold on 12/09/2024.
    //

import Foundation
import MapKit
import _MapKit_SwiftUI
import SwiftUI

class LocationsViewModel: ObservableObject {
    
        /// All loaded locations
    @Published var locations: [Location]
    
        // Maps current location
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    
        // Current region
    @Published var cameraPosition: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion())
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
        // Show list of location
    @Published var showLocationsList: Bool = false
    
    // Show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            let region = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
            
                // Update to MapCameraPosition
            cameraPosition = .region(region)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
            // Get the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation }) else {
            print("Could not find current indec in locations array!")
            return
        }
            // Check if current index is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is not valif
            // restart index
            guard let firtstLocation = locations.first else { return }
            showNextLocation(location: firtstLocation)
            return
        }
        // Next index is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
