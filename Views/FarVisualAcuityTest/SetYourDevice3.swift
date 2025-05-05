//
//  SetYourDevice3.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-05-05.
//

import SwiftUI

struct SetYourDevice3: View {
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                ProgressBar(fillAmount: 0.6)
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
                    BrandHeader(title: "Measure 8 Feet", topPadding: 0)
                    Text("Using a mesauring tape or ruler, mark a spot 8 feet (2.4 meters) from your device.")
                        .font(.callout.weight(.bold))
                        .minimumScaleFactor(0.8)
                        .padding(.vertical, geo.size.height * 0.015)
                    Text("3/4")
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
                    Text("Don't have a measuring tape?")
                        .font(.callout.weight(.bold))
                        .minimumScaleFactor(0.8)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, geo.size.height * 0.03)
                        .padding(.bottom, geo.size.height * 0.015)
                    NavigationLink(destination: StepCountingShoeSize()) {
                        PrimaryButton(title: "Use Step Counting", inverted: true)
                    }
                    .padding(.horizontal, geo.size.width * 0.05)
                    Spacer()
                }
                .padding(.horizontal, geo.size.width * 0.05)
                HStack(spacing: geo.size.width * 0.05) {
                    NavigationLink(destination: SetYourDevice()) {
                        PrimaryButton(title: "Back", inverted: true)
                    }
                    NavigationLink(destination: SetYourDevice2()) {
                        PrimaryButton(title: "8 Feet Measured")
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
struct SetYourDevice3_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SetYourDevice3()
        }
    }
}
