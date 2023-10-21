//
//  MapContainer.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 20.10.23.
//

import SwiftUI
import MapKit

struct MapContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView: MKMapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        mapView.showsUserTrackingButton = true
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.delegate = context.coordinator
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(self)
    }
}
