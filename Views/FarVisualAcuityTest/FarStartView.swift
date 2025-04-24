//
//  FarStartView.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct FarStartView: View {
    @State private var navigate = false

    var body: some View {
        VStack(spacing: 0) {
            NavBar(title: "Distance Vision Test")
            ProgressView(value: 0.25)
                .progressViewStyle(.linear)
                .padding(.top)
            Spacer()
            VStack {
                Image("far-detail")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 350, maxHeight: 250)
                    .clipped()
                    .padding(.horizontal)
                Text("Part 2: Distance Vision Test")
                    .font(.title2.weight(.semibold))
                    .foregroundColor(Color("BrandBlue"))
                    .fixedSize(horizontal: false, vertical: true)
                Text("Let's get started!")
                    .font(.callout.weight(.light))
                    .multilineTextAlignment(.center)
                CSpinner()
                    .frame(width: 30, height: 30)
                    .padding(.top, 10)
            }
            .padding(.horizontal)
            Spacer()
            PrimaryButton(title: "Continue") {
                navigate = true
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal)
            .padding(.bottom, 24)
            .accessibilityIdentifier("continueButton")
        }
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.bottom)
        .navigationDestination(isPresented: $navigate) {
            WhatToExpectView()
        }
    }
}

#Preview {
    NavigationStack {
        FarStartView()
    }
}
