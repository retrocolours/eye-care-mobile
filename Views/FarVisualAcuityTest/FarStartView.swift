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
            VStack(spacing: 0) {
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
                        .padding(.bottom, 0)
                    Text("Part 2: Distance Vision Test")
                        .font(.title2.weight(.semibold))
                        .foregroundColor(Color("BrandBlue"))
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 0)
                    Text("Let's get started!")
                        .font(.callout.weight(.light))
                        .multilineTextAlignment(.center)
                    CSpinner()
                        .frame(width: 48, height: 48)
                        .padding(.bottom, 40)
                        .padding(.top, 20)
                        
                }
                Spacer()

            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    navigate = true
                }
            }
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
