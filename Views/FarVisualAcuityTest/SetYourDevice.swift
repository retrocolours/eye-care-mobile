//
//  SetYourDevice.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-30.
//

import SwiftUI

struct SetYourDevice: View {
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                ProgressBar(fillAmount: 0.3)
                
            }
        }
        // Navigation Bar Styling
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Distance Vision Test")
        .toolbar {
            // Speaker icon
            ToolbarItem(placement: .navigationBarTrailing) {
                ScreenReader(textToSpeak: "Implement this!")
            }
        }
    }
}

// Preview
struct SetYourDevice_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SetYourDevice()
        }
    }
}
