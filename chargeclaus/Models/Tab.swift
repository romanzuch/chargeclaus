//
//  Tab.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.10.23.
//

import Foundation

enum Tab: String {
    case home = "HOME"
    case chargeNow = "CHARGE_NOW"
    case history = "HISTORY"
    case more = "MORE"
}

extension Tab {
    func getIconName() -> String {
        switch self {
        case .home:
            return "house"
        case .chargeNow:
            return "bolt.car"
        case .history:
            return "building.columns"
        case .more:
            return "line.3.horizontal"
        }
    }
}
