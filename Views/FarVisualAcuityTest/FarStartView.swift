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
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    FarHeader(onBack: {
                        // Pop or dismiss action here (if needed)
                    }, onScreenReader: {
                        // Screen reader action here
                    })
                    // — Progress Bar at 50%
                    ProgressView(value: 0.25)
                        .progressViewStyle(.linear)
                        .padding(.top)
                    Spacer()
                    VStack {
                        Image("far-detail")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.5)
                            .clipped()
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("Part 2: Distance Vision Test")
                            .font(.title2.weight(.semibold))
                            .foregroundColor(Color("BrandBlue"))
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, 0)
                        
                        Text("Let's get started!")
                            .font(.callout.weight(.light))
                            .multilineTextAlignment(.center)
                        
                        CSpinner()
                            .frame(width: 30, height: 30)
                            .padding(.top, 10)
                        
                    }
                    Spacer()
                }
            }
            VStack {
                Spacer()
                PrimaryButton(title: "Continue") {
                    navigate = true
                }
                .padding(.bottom, geometry.safeAreaInsets.bottom > 0 ? geometry.safeAreaInsets.bottom : 24)
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationDestination(isPresented: $navigate) {
                WhatToExpectView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        FarStartView()
    }
}
