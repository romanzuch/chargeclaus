//
//  LocationDetails.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.12.23.
//

import SwiftUI

struct LocationDetails: View {
    
    let location: Location?
    
    var body: some View {
        if let location = location {
            Text(location.address.getFullAddress())
        } else {
            Text("Keine Daten vorhanden.")
        }
    }
}
