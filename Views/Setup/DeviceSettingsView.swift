//
//  DeviceSettingsView.swift
//  visual-acuity-test
//
//  Created by acidgypsycat on 2025-04-25.
//


import SwiftUI

struct DeviceSettingsView: View {
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                // Progress bar at 10%
                ProgressBar(fillAmount: 0.1)
                    .frame(height: 4)
                
                // Illustration
                Image("phone-icons")
                    .resizable()
                    .scaledToFit()
                    .frame(
                        maxWidth: geo.size.width * 0.6,
                        maxHeight: geo.size.height * 0.3
                    )
                    .frame(maxWidth: .infinity)

                BrandHeader(
                    title: "Device Settings Updated",
                    topPadding: geo.size.height * 0.015
                )
                .padding(.horizontal, geo.size.width * 0.05)
                
                // Checklist
                VStack(spacing: 0) {
                    HStack(spacing: 12) {
                        Image(systemName: "sun.max.fill")
                            .font(.title3)
                            .foregroundColor(Color("BrandBlue"))
                        Text("Max Screen brightness")
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, geo.size.height * 0.015)
                    Divider()

                    HStack(spacing: 12) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.title3)
                            .foregroundColor(Color("BrandBlue"))
                        Text("Max Volume level")
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, geo.size.height * 0.015)
                    Divider()
                }
                .padding(.horizontal, geo.size.width * 0.05)

                // Explanatory text
                Text("Optimal device settings ensure standardized testing conditions and reliable results.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, geo.size.width * 0.05)
                    .padding(.top, geo.size.height * 0.015)

                Spacer()

                // Next button
                NavigationLink(destination: AllowAccessView()) {
                    PrimaryButton(title: "Next")
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
      
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ScreenReader(
                    textToSpeak:
                    "Device Settings Updated. Max Screen brightness set. Max Volume level set. Optimal device settings ensure standardized testing conditions and reliable results."
                )
            }
        }
        .tint(.black)
    }
}

struct DeviceSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DeviceSettingsView()
        }
    }
}
