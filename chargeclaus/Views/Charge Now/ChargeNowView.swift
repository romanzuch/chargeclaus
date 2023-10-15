//
//  ChargeNowView.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.10.23.
//

import SwiftUI

struct ChargeNowView: View {
    var body: some View {
        NavigationStack {
            Text(NSLocalizedString("CHARGE_NOW", comment: ""))
                .navigationTitle(NSLocalizedString("CHARGE_NOW", comment: ""))
        }
    }
}

#Preview {
    ChargeNowView()
}
