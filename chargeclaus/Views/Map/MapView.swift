//
//  MapView.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.10.23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map()
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
