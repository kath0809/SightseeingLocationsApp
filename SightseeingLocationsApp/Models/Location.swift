//
//  Location.swift
//  SightseeingLocationsApp
//
//  Created by Karima Thingvold on 12/09/2024.
//

import Foundation
import MapKit


struct Location: Identifiable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D // CoreLocation from the mapKit
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        name + cityName
            /// if name = "Colosseum"
            /// and cityName = "Rome"
            /// then id will be "ColosseumRome"
            /// This will let us have two models with the same name or cityname
    }
    
}
