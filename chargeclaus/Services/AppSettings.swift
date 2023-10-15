//
//  AppSettings.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.10.23.
//

import Foundation

class AppSettings: ObservableObject {
    @Published var selectedTab: Tab = .home
}
