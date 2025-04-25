//
//  BeforeStartingView.swift
//  visual-acuity-test
//
//  Created by acidgypsycat on 2025-04-24.
//

import SwiftUI

struct BeforeStartingView: View {
    private let titles = [
        "A room large enough to stand 8 feet from your device",
        "Good lighting",
        "A quiet environment",
        "Your regular glasses or contacts (if you wear any)",
        "Speak clearly into microphone"
    ]
    
    @State private var screenAppeared = false
    @State private var visibleCount = 0
    @State private var showButton = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Nav‐bar
            Text("Before Starting")
                .font(.headline.weight(.semibold))
                .foregroundColor(Color("BrandBlue"))
                .padding(.top, 16)
            
            Text("For accurate results, you'll need:")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            // Checklist items fade in one by one
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(titles.indices, id: \.self) { idx in
                        if idx < visibleCount {
                            VStack(spacing: 0) {
                                HStack(alignment: .top, spacing: 12) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.title3)
                                        .foregroundColor(Color("BrandBlue"))
                                        .frame(width: 24)
                                    
                                    Text(titles[idx])
                                        .font(.body)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding(.vertical, 12)
                                
                                Divider()
                            }
                            .transition(.opacity)
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
            
            Spacer()
            
            // Navigate to DeviceSettingsView
            if showButton {
                NavigationLink("I’m Ready to Begin") {
                    DeviceSettingsView()
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color("BrandBlue"))
                .cornerRadius(28)
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
                .transition(.opacity)
            }
        }
        .opacity(screenAppeared ? 1 : 0)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
        .toolbar {
            // speaker icon on the right
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "speaker.wave.2")
                    .foregroundColor(.primary)
            }
        }
        .onAppear {
            // Fade the entire screen in
            withAnimation(.easeIn(duration: 0.4)) {
                screenAppeared = true
            }
            
            // Stagger each checklist item
            let initialDelay: TimeInterval = 0.6
            let perItemDelay: TimeInterval = 0.8
            let fadeDuration: TimeInterval = 0.7
            let buttonDelay: TimeInterval = 0.4
            
            for idx in titles.indices {
                let when = initialDelay + Double(idx) * perItemDelay
                DispatchQueue.main.asyncAfter(deadline: .now() + when) {
                    withAnimation(.easeIn(duration: fadeDuration)) {
                        visibleCount = idx + 1
                    }
                }
            }
            
            // Show the “I’m Ready to Begin” button after all items appear
            let totalDelay = initialDelay
                             + Double(titles.count) * perItemDelay
                             + buttonDelay
            DispatchQueue.main.asyncAfter(deadline: .now() + totalDelay) {
                withAnimation(.easeIn(duration: fadeDuration)) {
                    showButton = true
                }
            }
        }
    }
}

struct BeforeStartingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BeforeStartingView()
        }
    }
}

