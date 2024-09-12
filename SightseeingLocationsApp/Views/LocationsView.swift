    //
    //  LocationsView.swift
    //  SightseeingLocationsApp
    //
    //  Created by Karima Thingvold on 12/09/2024.
    //

import SwiftUI
import MapKit

struct LocationsView: View {
    
        //@State private var vm = LocationsViewModel()
    @EnvironmentObject private var vm: LocationsViewModel
    
        //    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    
    var body: some View {
        ZStack {
            Map(position: $vm.cameraPosition)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
            }
        }
    }
}
#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

    /// Helps to keep the body cleaner
extension LocationsView {
    
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                // Turn off the animation of the header
                    .animation(.none, value: vm.mapLocation)
                
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .padding()
                        // turns the arrow when location list is showing
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
