//
//  SetYourDevice4.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-05-05.
//

import SwiftUI

struct SetYourDevice4: View {
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                ProgressBar(fillAmount: 0.8)
                VStack(alignment: .leading, spacing: 0) {
                    Image("place-marker")
                        .resizable()
                        .scaledToFit()
                        .frame(
                            maxWidth: geo.size.width * 0.95,
                            maxHeight: geo.size.height * 0.4
                        )
                        .clipped()
                        .padding(.horizontal, geo.size.width * 0.05)
                        .padding(.vertical, geo.size.height * 0.025)
                    BrandHeader(title: "Place your marker", topPadding: 0)
                    Text("Place your marker on the floor - this is where you'll stand later.")
                        .font(.callout.weight(.bold))
                        .minimumScaleFactor(0.8)
                        .padding(.vertical, geo.size.height * 0.015)
                    Text("4/4")
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
                HStack(spacing: geo.size.width * 0.05) {
                    NavigationLink(destination: SetYourDevice3()) {
                        PrimaryButton(title: "Back", inverted: true)
                    }
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
struct SetYourDevice4_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SetYourDevice4()
        }
    }
}
