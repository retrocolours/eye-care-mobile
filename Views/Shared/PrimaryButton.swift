//
//  PrimaryButton.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void
    var isEnabled: Bool = true
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isEnabled ? Color("BrandBlue") : Color.gray.opacity(0.5))
                .cornerRadius(100)
                .opacity(isEnabled ? 1 : 0.7)
        }
        .disabled(!isEnabled)
        .accessibilityLabel(title)
    }
}

#Preview {
    VStack(spacing: 20) {
        PrimaryButton(title: "Continue", action: {})
            .padding(.horizontal, 32)
        PrimaryButton(title: "Disabled", action: {}, isEnabled: false)
            .padding(.horizontal, 32)
    }
    .background(Color(.systemBackground))
    .padding(.vertical, 40)
}
