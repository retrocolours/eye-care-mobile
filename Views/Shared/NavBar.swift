//
//  NavBar.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct NavBar: View {
    @Environment(\.dismiss) private var dismiss
    var onBack: (() -> Void)? = nil
    var onScreenReader: (() -> Void)? = nil
    let title: String

    var body: some View {
        HStack {
            Button(action: {
                if let onBack = onBack {
                    onBack()
                } else {
                    dismiss()
                }
            }) {
                Image(systemName: "chevron.left")
                    .font(.title2.weight(.semibold))
                    .foregroundColor(.primary)
            }
            .accessibilityLabel("Back")
            
            Spacer()
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            Button(action: {
                if let onScreenReader = onScreenReader {
                    onScreenReader()
                } else {
                    // Default: announce the title for accessibility
                    UIAccessibility.post(notification: .announcement, argument: title)
                }
            }) {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            .accessibilityLabel("Screen Reader")
        }
        .padding([.horizontal, .top])
        .frame(height: 44)
        .background(Color(.systemBackground).opacity(0.95))
    }
}

#Preview {
    NavBar(title: "Preview Title")
}
