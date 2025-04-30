//
//  ProgressBar.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-25.
//

import SwiftUI

struct ProgressBar: View {
    var fillAmount: Double // 0.0 to 1.0
    var barHeight: CGFloat = 8
    var backgroundColor: Color = .gray.opacity(0.3)
    var fillColor: Color = Color("BrandBlue")

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(backgroundColor)
                .frame(height: barHeight)
            Rectangle()
                .fill(fillColor)
                .frame(height: barHeight)
                .scaleEffect(x: max(0, min(fillAmount, 1)), y: 1, anchor: .leading)
                .animation(.linear, value: fillAmount)
        }
        .frame(height: barHeight)
        .clipped()
    }
}

#Preview {
    ProgressBar(fillAmount: 0.25)
}
