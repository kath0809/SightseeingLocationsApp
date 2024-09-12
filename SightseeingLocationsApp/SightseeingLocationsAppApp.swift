//
//  SightseeingLocationsAppApp.swift
//  SightseeingLocationsApp
//
//  Created by Karima Thingvold on 12/09/2024.
//

import SwiftUI

@main
struct SightseeingLocationsAppApp: App {
    
    @State private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
