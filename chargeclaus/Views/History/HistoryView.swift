//
//  HistoryView.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.10.23.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationStack {
            Text(NSLocalizedString("HISTORY", comment: ""))
                .navigationTitle(NSLocalizedString("HISTORY", comment: ""))
        }
    }
}

#Preview {
    HistoryView()
}
