//
//  WhatToExpectView.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct WhatToExpectView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 0) {
            NavBar(title: "Distance Vision Test")
            ProgressView(value: 0.25)
                .progressViewStyle(.linear)
                .padding(.top)
            Spacer()
        }
        .hideBackButton()
    }
}

#Preview {
    WhatToExpectView()
}
