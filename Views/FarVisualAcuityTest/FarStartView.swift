//
//  FarStartView.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct FarStartView: View {
    var onContinue: (() -> Void)? = nil
    @State private var navigate = false
    @State private var spinnerID = UUID()

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    VStack(spacing: 0) {
                        FarNavBar()
                        ProgressView(value: 0.25)
                            .progressViewStyle(.linear)
                            .padding(.top)
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
                            CSpinner()
                                .id(spinnerID)
                                .frame(width: 30, height: 30)
                                .padding(.top, geo.size.height * 0.015)
                        }
                        .padding(.horizontal, geo.size.width * 0.04)
                        Spacer()
                        PrimaryButton(title: "Continue") {navigate = true}
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.horizontal, geo.size.width * 0.04)
                            .padding(.bottom, geo.safeAreaInsets.bottom > 0 ? geo.safeAreaInsets.bottom : geo.size.height * 0.03)
                            .accessibilityIdentifier("continueButton")
                    }
                    // Navigation Link
                    NavigationLink(destination: WhatToExpectView(), isActive: $navigate) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
            // Reset spinner every time this view appears
            .onAppear {
                spinnerID = UUID()
            }
        }
    }
}

#Preview {
    FarStartView()
}
