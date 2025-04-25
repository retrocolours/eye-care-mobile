//
//  DeviceSettingsView.swift
//  visual-acuity-test
//
//  Created by acidgypsycat on 2025-04-25.
//

import SwiftUI

struct DeviceSettingsView: View {
    var body: some View {
        VStack(spacing: 0) {
            // 1) Progress bar at 75%
            ProgressView(value: 0.1)
                .progressViewStyle(.linear)

            // 2) Scrollable content
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Spacer().frame(height: 16)

                    // Illustration (centered)
                    Image("phone-icons")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 200, maxHeight: 200)
                        .frame(maxWidth: .infinity)

                    // Title — now left-aligned
                    Text("Device Settings Updated")
                        .font(.title2.weight(.semibold))
                        .foregroundColor(Color("BrandBlue"))
                        .padding(.horizontal, 24)
                        .multilineTextAlignment(.leading)

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
                        .padding(.vertical, 12)
                        Divider()

                        HStack(spacing: 12) {
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.title3)
                                .foregroundColor(Color("BrandBlue"))
                            Text("Max Volume level")
                                .font(.body)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 12)
                        Divider()
                    }
                    .padding(.horizontal, 24)

                    // Explanatory text — left-aligned
                    Text("Optimal device settings ensure standardized testing conditions and reliable results.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 24)

                    Spacer()
                }
            }

            // 3) Next button
            NavigationLink("I’m Ready to Begin") {
                AllowAccessView()
            }

            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color("BrandBlue"))
            .cornerRadius(28)
            .padding(.horizontal, 24)
            .padding(.bottom, 16)
        }
        // 4) NavBar styling
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "speaker.wave.2.fill")
            }
        }
    }
}

struct DeviceSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DeviceSettingsView()
        }
    }
}
