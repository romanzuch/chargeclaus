//
//  MapContainerCoordinator.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 20.10.23.
//

import MapKit

class MapContainerCoordinator: NSObject, MKMapViewDelegate {
    var mapContainer: MapContainer
    
    init(_ container: MapContainer) {
        self.mapContainer = container
    }
}
