
//
//  ContentView.swift
//  visual-acuity-test
//
//  Created by acidgypsycat on 2025-04-22.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    // Top spacer
                    Spacer(minLength: geo.size.height * 0.05)

                    // Main illustration + title + dot + time + description
                    VStack(spacing: geo.size.height * 0.02) {
                        Image("main")
                            .resizable()
                            .scaledToFit()
                            .frame(
                                maxWidth: geo.size.width * 0.8,
                                maxHeight: geo.size.height * 0.3
                            )
                            .clipped()
                            .padding(.horizontal, geo.size.width * 0.1)

                        // Shared header
                        BrandHeader(
                            title: "Visual Acuity Test",
                            topPadding: geo.size.height * 0.015
                        )

                        // Page-indicator dot
                        Circle()
                            .fill(Color("BrandBlue"))
                            .frame(width: 6, height: 6)
                            .padding(.vertical, geo.size.height * 0.005)

                        // Duration label
                        Label {
                            Text("8 min")
                                .font(.subheadline)
                        } icon: {
                            Image(systemName: "clock")
                                .font(.subheadline)
                        }
                        .foregroundColor(.secondary)

                        // Description
                        Text("This vision test will evaluate how well you can see both up close and at a distance.")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.8)
                            .padding(.horizontal, geo.size.width * 0.1)
                    }

                    Spacer()

                    // Shared primary button
                    NavigationLink(destination: DisclaimerView()) {
                        PrimaryButton(title: "Start")
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
            // Inline nav + screen reader
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Visual Acuity Test")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ScreenReader(
                        textToSpeak:
                          "Visual Acuity Test. This vision test will evaluate how well you can see both up close and at a distance. Tap Start to begin."
                    )
                }
            }
        }
        .tint(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
