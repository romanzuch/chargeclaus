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
        TabView(selection: $settings.selectedTab) {
            DashboardView()
                .tabItem {
                    Label(
                        title: {
                            Text(NSLocalizedString(Tab.home.rawValue, comment: ""))
                        },
                        icon: {
                            Image(systemName: Tab.home.getIconName())
                        }
                    )
                }
                .tag(Tab.home)
            ChargeNowView()
                .tabItem {
                    Label(
                        title: {
                            Text(NSLocalizedString(Tab.chargeNow.rawValue, comment: ""))
                        },
                        icon: {
                            Image(systemName: Tab.chargeNow.getIconName())
                        }
                    )
                }
                .tag(Tab.chargeNow)
            HistoryView()
                .tabItem {
                    Label(
                        title: {
                            Text(NSLocalizedString(Tab.history.rawValue, comment: ""))
                        },
                        icon: {
                            Image(systemName: Tab.history.getIconName())
                        }
                    )
                }
                .tag(Tab.history)
            MoreView()
                .tabItem {
                    Label(
                        title: {
                            Text(NSLocalizedString(Tab.more.rawValue, comment: ""))
                        },
                        icon: {
                            Image(systemName: Tab.more.getIconName())
                        }
                    )
                }
                .tag(Tab.more)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Location.self, inMemory: true)
        .environmentObject(AppSettings())
}
