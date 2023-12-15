//
//  MapView.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.10.23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var showDetails: Bool = false
    @StateObject private var mapViewModel: MapViewModel = MapViewModel()
    
    var body: some View {
        MapContainer(showDetails: $showDetails, mapViewModel: mapViewModel)
            .ignoresSafeArea()
            .sheet(isPresented: $showDetails) {
                LocationDetails(location: mapViewModel.selectedLocation)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.hidden)
                    .presentationBackgroundInteraction(.enabled(upThrough: .medium))
            }
    }
}

#Preview {
    MapView()
}
