//
//  LocationDetails.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.12.23.
//

import SwiftUI

struct LocationDetails: View {
    
    let location: Location?
    @StateObject private var vm: LocationDetailsViewModel = LocationDetailsViewModel()
    
    var body: some View {
        if let location = location, let connections = location.connections {
            VStack(alignment: .leading) {
                vm.getNumberOfConnectionsText(for: connections)
                    .fontWeight(.light)
                    .font(.caption)
                Text(location.address.getFullAddress())
                    .fontWeight(.bold)
                vm.getAvailableConnectionsText(for: connections)
                HStack {
                    Text("\(connections[0].type.rawValue)")
                        .font(.caption)
                    Spacer()
                    vm.getMaxPowerOutputText(for: connections)
                        .font(.caption)
                }
                Spacer()
            }
            .padding()
        } else {
            Text("Keine Daten vorhanden.")
        }
    }
}

#Preview {
    LocationDetails(location: Location.example)
}
