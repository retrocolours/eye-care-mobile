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
                    Image("phone-on-holder")
                        .resizable()
                        .scaledToFit()
                        .frame(
                            maxWidth: geo.size.width * 0.95,
                            maxHeight: geo.size.height * 0.4
                        )
                        .clipped()
                        .padding(.horizontal, geo.size.width * 0.05)
                        .padding(.vertical, geo.size.height * 0.025)
                    BrandHeader(title: "Set Your Device", topPadding: 0)
                    Text("Now, place your device on a stable surface where you can see the screen clearly.")
                        .font(.callout.weight(.bold))
                        .minimumScaleFactor(0.8)
                        .padding(.vertical, geo.size.height * 0.015)
                    Text("You'll need 8 feet of space in front of it for later testing.")
                        .font(.callout.weight(.bold))
                        .minimumScaleFactor(0.8)
                        .padding(.vertical, geo.size.height * 0.015)
                    Text("Click Next when ready.")
                        .font(.callout.weight(.bold))
                        .minimumScaleFactor(0.8)
                        .padding(.vertical, geo.size.height * 0.015)
                    Text("1/4")
                        .font(.system(size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize * 1.1, weight: .light))
                        .foregroundColor(Color("BrandBlue"))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color.white)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color("BrandBlue"), lineWidth: 1)
                        )
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Divider()
                        .padding(.top, geo.size.height * 0.025)
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
