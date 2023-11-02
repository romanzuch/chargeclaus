//
//  LocationAnnotation.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 21.10.23.
//

import MapKit

class LocationAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    let locationData: Location
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D, locationData: Location) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.locationData = locationData
    }
}
