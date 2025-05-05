//
//  SetYourDevice2.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-30.
//

import SwiftUI

struct SetYourDevice2: View {
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
                    BrandHeader(title: "Pick up a small object", topPadding: 0)
                    Text("Pick up a small object and keep it with you (like a coin or pen). You'll use it later to mark 8 feet on the floor.")
                        .font(.callout.weight(.bold))
                        .minimumScaleFactor(0.8)
                        .padding(.vertical, geo.size.height * 0.015)
                    Text("2/4")
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
                    NavigationLink(destination: SetYourDevice()) {
                        PrimaryButton(title: "Back", inverted: true)
                    }
                    NavigationLink(destination: SetYourDevice3()) {
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
struct SetYourDevice2_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SetYourDevice2()
        }
    }
}
