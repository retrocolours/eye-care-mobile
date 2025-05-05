//
//  PrimaryButton.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String

    var inverted: Bool = false
    
    var body: some View {
    Text(title)
        .font(.headline)
        .foregroundColor(inverted ? Color("BrandBlue") : .white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(inverted ? Color.white : Color("BrandBlue"))
        .cornerRadius(100)
        .overlay(
            RoundedRectangle(cornerRadius: 100)
                .stroke(Color("BrandBlue"), lineWidth: 2)
        )
        .opacity(1)
        .accessibilityLabel(title)
}
}

#Preview {
    VStack(spacing: 20) {
        PrimaryButton(title: "Continue")
        PrimaryButton(title: "Disabled", inverted: true)
        Button(action: { print("Tapped") }) {
            PrimaryButton(title: "Wrapped in Button")
        }
    }
}

