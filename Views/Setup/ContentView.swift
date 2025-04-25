
//
//  ContentView.swift
//  visual-acuity-test
//
//  Created by acidgypsycat on 2025-04-22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // Illustration
                Image("main")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                // Title
                Text("Visual Acuity Test")
                    .font(.title2.weight(.semibold))
                    .foregroundColor(.blue)
                    .padding(.top, 16)
                
                // Page indicator dot
                Circle()
                    .fill(Color.blue)
                    .frame(width: 6, height: 6)
                    .padding(.vertical, 8)
                
                // Duration label
                Label {
                    Text("8 min")
                        .font(.subheadline)
                } icon: {
                    Image(systemName: "clock")
                        .font(.subheadline)
                }
                .foregroundColor(.secondary)
                .padding(.bottom, 16)
                
                // Description
                Text("This vision test will evaluate how well you can see both up close and at a distance.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 32)
                
                Spacer()
                
                // Start button
                NavigationLink {
                    DisclaimerView()
                } label: {
                    Text("Start")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color("BrandBlue"))
                        .cornerRadius(28)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
            }

            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "speaker.wave.2.fill")
                }
            }
           
        }
    }
}
