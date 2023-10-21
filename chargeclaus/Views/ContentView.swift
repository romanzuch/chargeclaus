//
//  ContentView.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.10.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settings: AppSettings

    var body: some View {
        MapView()
    }
}

#Preview {
    ContentView()
        .environmentObject(AppSettings())
}
