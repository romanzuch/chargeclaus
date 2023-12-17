//
//  LocationDetailsViewModel.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.12.23.
//

import Foundation
import SwiftUI

class LocationDetailsViewModel: ObservableObject {
    private func getAvailableConnections(for connections: [Connection]) -> Int {
        let connectorsCountAvl: Int = connections.compactMap { connection in
            if connection.status == .available {
                return connection
            }
            return nil
        }.count
        return connectorsCountAvl
    }
    
    func getNumberOfConnectionsText(for connections: [Connection]) -> Text {
        if connections.count == 1 {
            return Text("\(connections.count) Ladesäule")
        } else {
            return Text("\(connections.count) Ladesäulen")
        }
    }
    
    func getAvailableConnectionsText(for connections: [Connection]) -> Text {
        let availableConnections: Int = self.getAvailableConnections(for: connections)
        if availableConnections >= 1 {
            return Text("\(availableConnections)").foregroundStyle(.green) +
            Text(" von \(connections.count)") +
            Text(" verfügbar").foregroundStyle(.green)
        } else {
            return Text("\(availableConnections)").foregroundStyle(.red) +
            Text(" von \(connections.count)") +
            Text(" verfügbar").foregroundStyle(.red)
        }
    }
    
    func getMaxPowerOutputText(for connections: [Connection]) -> Text {
        let maxPowerOutput: Int = connections.max(by: { $0.power < $1.power })?.power ?? 0
        return Text("max. ") + Text("\(maxPowerOutput) kW").foregroundStyle(.orange)
    }
}
