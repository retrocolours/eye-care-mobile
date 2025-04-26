//
//  PrimaryButton.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String

    var isEnabled: Bool = true
    
    var body: some View {
    Text(title)
        .font(.headline)
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(isEnabled ? Color("BrandBlue") : Color.gray.opacity(0.5))
        .cornerRadius(100)
        .opacity(isEnabled ? 1 : 0.7)
        .accessibilityLabel(title)
}
}

#Preview {
    VStack(spacing: 20) {
        PrimaryButton(title: "Continue")
        PrimaryButton(title: "Disabled", isEnabled: false)
        Button(action: { print("Tapped") }) {
            PrimaryButton(title: "Wrapped in Button")
        }
    }
}

