//
//  AllowAccessView.swift
//  visual-acuity-test
//
//  Created by acidgypsycat on 2025-04-25.
//


import SwiftUI

struct AllowAccessView: View {
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                // Progress bar at 20%
                ProgressBar(fillAmount: 0.2)
                    .frame(height: 4)

                // Illustration
                Image("phone-icons-2")
                    .resizable()
                    .scaledToFit()
                    .frame(
                        maxWidth: geo.size.width * 0.6,
                        maxHeight: geo.size.height * 0.3
                    )
                    .frame(maxWidth: .infinity)

                // Heading
                BrandHeader(
                    title: "To proceed with your vision test, we require access to",
                    topPadding: geo.size.height * 0.015
                )
                .padding(.horizontal, geo.size.width * 0.05)

                // Permissions list
                VStack(spacing: 0) {
                    HStack(spacing: 12) {
                        Image(systemName: "mic.fill")
                            .font(.title3)
                            .foregroundColor(Color("BrandBlue"))
                        Text("Microphone")
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, geo.size.height * 0.015)
                    Divider()

                    HStack(spacing: 12) {
                        Image(systemName: "camera.fill")
                            .font(.title3)
                            .foregroundColor(Color("BrandBlue"))
                        Text("Camera")
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, geo.size.height * 0.015)
                    Divider()
                }
                .padding(.horizontal, geo.size.width * 0.05)

                // Explanatory text
                Text("Microphone and camera access are required to conduct the test, ensuring accurate and reliable results.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, geo.size.width * 0.05)
                    .padding(.top, geo.size.height * 0.015)

                Spacer()

                // “I’m Ready to Begin” button
                NavigationLink(destination: FindTestLocationView()) {
                    PrimaryButton(title: "I’m Ready to Begin")
                }
                .padding(.horizontal, geo.size.width * 0.1)
                .padding(.bottom,
                         geo.safeAreaInsets.bottom > 0
                           ? geo.safeAreaInsets.bottom
                           : geo.size.height * 0.03
                )
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        // 7) Single inline nav-bar
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ScreenReader(
                    textToSpeak:
                    "To proceed with your vision test, we require access to your microphone and camera. Microphone and camera access are required to conduct the test, ensuring accurate and reliable results."
                )
            }
        }
        .tint(.black)
    }
}

struct AllowAccessView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AllowAccessView()
        }
    }
}
