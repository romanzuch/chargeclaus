//
//  ContentView.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.10.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var locations: [Location]
    @EnvironmentObject var settings: AppSettings

    var body: some View {
        HomeView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Location.self, inMemory: true)
        .environmentObject(AppSettings())
}
