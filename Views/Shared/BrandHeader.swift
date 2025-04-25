//
//  BrandHeader.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-25.
//

import SwiftUI

struct BrandHeader: View {
    var title: String
    var topPadding: CGFloat

    var body: some View {
        Text(title)
            .font(.title2.weight(.semibold))
            .foregroundColor(Color("BrandBlue"))
            .minimumScaleFactor(0.7)
            .lineLimit(2)
            .padding(.top, topPadding)
    }
}

#Preview {
    BrandHeader(title:"Some Title", topPadding: 16)
}
