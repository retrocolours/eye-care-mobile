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
                ProgressBar(fillAmount: 0.5)
                VStack(alignment: .leading, spacing: 0) {
                    Image("person-with-contacts")
                        .resizable()
                        .scaledToFit()
                        .frame(
                            maxWidth: geo.size.width * 0.95,
                            maxHeight: geo.size.height * 0.4
                        )
                        .clipped()
                        .padding(.horizontal, geo.size.width * 0.05)
                        .padding(.vertical, geo.size.height * 0.025)
                    BrandHeader(title: "Keep your Contact Lenses On", topPadding: 0)
                    Text("Keep your Contact Lenses on during the test. Avoid wearing tinted colored lenses.")
                        .font(.callout.weight(.medium))
                        .minimumScaleFactor(0.8)
                        .foregroundColor(Color("GreyText"))
                        .padding(.vertical, geo.size.height * 0.015)
                    Spacer()
                }
                .padding(.horizontal, geo.size.width * 0.05)
                HStack(spacing: geo.size.width * 0.025) {
                    PrimaryButton(title: "Back", inverted: true)
                    NavigationLink(destination: SetYourDevice2()) {
                        PrimaryButton(title: "Next")
                    }
                }
                .padding(.horizontal, geo.size.width * 0.05)
                .padding(.bottom, geo.safeAreaInsets.bottom > 0 ? geo.safeAreaInsets.bottom : geo.size.height * 0.03)
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
