//
//  FindTestLocation.swift
//  visual-acuity-test
//
//  Created by acidgypsycat on 2025-04-25.
//


import SwiftUI

struct FindTestLocationView: View {
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                // Progress bar at 30%
                ProgressBar(fillAmount: 0.3)
                    .frame(height: 4)

                // Illustration
                Image("brightness")
                    .resizable()
                    .scaledToFit()
                    .frame(
                        maxWidth: geo.size.width * 0.8,
                        maxHeight: geo.size.height * 0.4
                    )
                    .frame(maxWidth: .infinity)

                // Heading
                BrandHeader(
                    title: "Find Test Location",
                    topPadding: geo.size.height * 0.015
                )
                .padding(.horizontal, geo.size.width * 0.05)


                // Numbered steps
                VStack(spacing: 0) {
                    // Step 1
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "1.circle")
                            .font(.title3)
                            .foregroundColor(Color("BrandBlue"))
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Find a bright, comfortable spot")
                            Text("You can sit or stand during the test")
                        }
                        .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, geo.size.height * 0.015)
                    Divider()

                    // Step 2
                    HStack(spacing: 12) {
                        Image(systemName: "2.circle")
                            .font(.title3)
                            .foregroundColor(Color("BrandBlue"))
                        Text("Point camera at closest lamp or window")
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, geo.size.height * 0.015)
                    Divider()
                }
                .padding(.horizontal, geo.size.width * 0.05)

                Spacer()

                // button
                NavigationLink(destination: BrightnessCheckView()) {
                                    PrimaryButton(title: "Start Brightness Checking")
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
        // Inline nav-bar & accessibility
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ScreenReader(
                    textToSpeak:
                    "Find Test Location. Step one: find a bright, comfortable spot—you can sit or stand. Step two: point your camera at the closest lamp or window."
                )
            }
        }
        .tint(.black)
    }
}

struct FindTestLocationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FindTestLocationView()
        }
    }
}

