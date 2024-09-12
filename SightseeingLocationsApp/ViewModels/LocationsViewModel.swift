//
//  LocationsViewModel.swift
//  SightseeingLocationsApp
//
//  Created by Karima Thingvold on 12/09/2024.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
    
}
