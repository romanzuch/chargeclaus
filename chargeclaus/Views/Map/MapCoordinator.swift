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
    
    /// This method is called when the region of the map view changes, allowing you to fetch and display location annotations on the map.
    /// - Parameters:
    ///   - mapView: The map view on which location annotations will be displayed.
    ///   - animated: A boolean flag indicating whether the region change is animated.
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        FirebaseService.main.getLocations { result in
            switch result {
            case .success(let locations):
                let annotations: [LocationAnnotation] = locations.compactMap { location in
                    if let _ = location.provider {
                        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(
                            latitude: CLLocationDegrees(location.coordinates.lat),
                            longitude: CLLocationDegrees(location.coordinates.lng)
                        )
                        let newAnnotation: LocationAnnotation = LocationAnnotation(
                            title: nil,
                            subtitle: nil,
                            coordinate: coordinates,
                            locationData: location
                        )
                        return newAnnotation
                    }
                    return nil
                }
                mapView.addAnnotations(annotations)
            case .failure(let error):
                // do something with the error
                print(error.localizedDescription)
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        } else {
            if let locationAnnotation = annotation as? LocationAnnotation {
                let annotationView: MKMarkerAnnotationView = self.styleAnnotationView(for: locationAnnotation)
                return annotationView
            }
            return nil
        }
    }
    
    private func styleAnnotationView(for annotation: LocationAnnotation) -> MKMarkerAnnotationView {
        let annotationView: MKMarkerAnnotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "location")
        switch annotation.locationData.status {
        case .available:
            annotationView.markerTintColor = .green
        case .occupied:
            annotationView.markerTintColor = .red
        case .unknown:
            annotationView.markerTintColor = .gray
        }
        annotationView.glyphImage = nil
        annotationView.glyphText = self.getAnnotationText(for: annotation)
        annotationView.canShowCallout = true
        return annotationView
    }
    
    private func getAnnotationText(for annotation: LocationAnnotation) -> String? {
        if let connectors: [Connection] = annotation.locationData.connections {
            let connectorsCountMax: Int = connectors.count
            let connectorsCountAvl: Int = connectors.compactMap { connection in
                if connection.status == .available {
                    return connection
                }
                return nil
            }.count
            return "\(connectorsCountAvl)/\(connectorsCountMax)"
        }
        return nil
    }
    
}
