//
//  ProgressBar.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-25.
//

import SwiftUI

struct ProgressBar: View {
    var fillAmount: Double
    var body: some View {
        ProgressView(value: fillAmount)
            .progressViewStyle(.linear)
            .tint(Color("BrandBlue"))
    }
}

#Preview {
    ProgressBar(fillAmount: 0.25)
}
