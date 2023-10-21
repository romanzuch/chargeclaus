//
//  MapCoordinator.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 21.10.23.
//

import MapKit

class MapCoordinator: NSObject, MKMapViewDelegate {
    var mapContainer: MapContainer
    
    init(_ mapContainer: MapContainer) {
        self.mapContainer = mapContainer
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        FirebaseService.main.getLocations { result in
            switch result {
            case .success(let locations):
                // do something with the results
                print(locations.count)
            case .failure(let error):
                // do something with the error
                print(error.localizedDescription)
            }
        }
    }
}
