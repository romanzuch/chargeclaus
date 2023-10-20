//
//  MapContainer.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 20.10.23.
//

import MapKit
import SwiftUI

struct MapContainer: UIViewRepresentable {
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // do something
    }
    
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView()
    }
    
    func makeCoordinator() -> MapContainerCoordinator {
        MapContainerCoordinator(self)
    }
    
}
