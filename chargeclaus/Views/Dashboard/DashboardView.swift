//
//  DashboardView.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.10.23.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationStack {
            Text(NSLocalizedString("DASHBOARD", comment: ""))
                .navigationTitle(NSLocalizedString("DASHBOARD", comment: ""))
        }
    }
}

#Preview {
    DashboardView()
}
