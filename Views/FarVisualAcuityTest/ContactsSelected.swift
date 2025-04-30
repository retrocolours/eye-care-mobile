//
//  ContactsSelected.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-30.
//

import SwiftUI

struct ContactsSelected: View {
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                ProgressBar(fillAmount: 0.4)
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
                    
                    HStack {
                        Text("Contact Lenses")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 24, height: 24)
                            Circle()
                                .stroke(Color("BrandBlue"), lineWidth: 2)
                                .frame(width: 24, height: 24)
                            Image(systemName: "checkmark")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .bold))
                        }
                    }
                    .padding(16)
                    .background(RoundedRectangle(cornerRadius: 5)
                        .fill(Color("BrandBlue"))
                    )
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("BrandBlue"), lineWidth: 1)
                    )
                    Spacer()
                }
                .padding(.horizontal, geo.size.width * 0.05)
                
                NavigationLink(destination: SetYourDevice()) {
                    PrimaryButton(title: "I Am Ready")
                }
                .padding(.horizontal, geo.size.width * 0.1)
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
struct ContactsSelected_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContactsSelected()
        }
    }
}
