//
//  LocationsView.swift
//  SightseeingLocationsApp
//
//  Created by Karima Thingvold on 12/09/2024.
//

import SwiftUI

struct LocationsView: View {
    
    //@State private var vm = LocationsViewModel()
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) {
                Text($0.name)
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
