//
//  MoreView.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.10.23.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationStack {
            Text(NSLocalizedString("MORE", comment: ""))
                .navigationTitle(NSLocalizedString("MORE", comment: ""))
        }
    }
}

#Preview {
    MoreView()
}
