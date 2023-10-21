//
//  MapViewModel.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 20.10.23.
//

import SwiftUI
import MapKit

struct MapContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> MapView {
        return MapView()
    }
}
