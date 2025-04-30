//
//  FarStartView.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct FarStartView: View {
    @State private var spinnerID = UUID()
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    VStack(spacing: 0) {
                        ProgressBar(fillAmount: 0.1)
                        Spacer(minLength: geo.size.height * 0.03)
                        VStack(spacing: geo.size.height * 0.02) {
                            Image("far-detail")
                                .resizable()
                                .scaledToFit()
                                .frame(
                                    maxWidth: geo.size.width * 0.85,
                                    maxHeight: geo.size.height * 0.32
                                )
                                .clipped()
                                .padding(.horizontal, geo.size.width * 0.05)
                            BrandHeader(title: "Part 2: Distance Vision Test", topPadding: geo.size.height * 0.015)
                            Text("Let's get started!")
                                .font(.callout.weight(.light))
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.8)
                                .foregroundColor(Color("GreyText"))
                            CSpinner()
                                .id(spinnerID)
                                .frame(width: 30, height: 30)
                                .padding(.top, geo.size.height * 0.015)
                        }
                        .padding(.horizontal, geo.size.width * 0.04)
                        Spacer()
                        NavigationLink(destination: WhatToExpectView()) {
                            PrimaryButton(title: "Continue")
                        }
                        .padding(.horizontal, geo.size.width * 0.1)
                        .padding(.bottom, geo.safeAreaInsets.bottom > 0 ? geo.safeAreaInsets.bottom : geo.size.height * 0.03)
                    }
                }
            }
            // Reset spinner every time this view appears
            .onAppear {
                spinnerID = UUID()
            }
            // Navigation Bar Styling
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Distance Vision Test")
            .toolbar {
                // Speaker icon
                ToolbarItem(placement: .navigationBarTrailing) {
                    ScreenReader(textToSpeak: "Part 2: Distance Vision Test. Let's get started!")
                }
            }
        }.tint(.black)
    }
}

#Preview {
    FarStartView()
}
