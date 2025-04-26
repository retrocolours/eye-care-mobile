//
//  AllowAccessView.swift
//  visual-acuity-test
//
//  Created by acidgypsycat on 2025-04-25.
//

import SwiftUI

struct AllowAccessView: View {
    var body: some View {
        VStack(spacing: 0) {
            ProgressBar(fillAmount: 0.2)
            // Main content
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Spacer().frame(height: 16)

                    // Combined illustration
                    Image("phone-icons-2")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 200, maxHeight: 200)
                        .frame(maxWidth: .infinity)

                    // Heading
                    Text("To proceed with your vision test, we require access to")
                        .font(.title2.weight(.semibold))
                        .foregroundColor(Color("BrandBlue"))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 24)

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
                        .padding(.vertical, 12)
                        Divider()

                        HStack(spacing: 12) {
                            Image(systemName: "camera.fill")
                                .font(.title3)
                                .foregroundColor(Color("BrandBlue"))
                            Text("Camera")
                                .font(.body)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 12)
                        Divider()
                    }
                    .padding(.horizontal, 24)

                    // Explanatory text
                    Text("Microphone and camera access are required to conduct the test, ensuring accurate and reliable results.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 24)

                    Spacer()
                }
            }

            NavigationLink("I’m Ready to Begin") {
                FindTestLocationView()
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
        // Nav‐bar
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ScreenReader(textToSpeak: "Fill me in")
            }
        }
    }
}

struct AllowAccessView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AllowAccessView()
        }
    }
}
