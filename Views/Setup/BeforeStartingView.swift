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
    
    // drives the staggered reveal
    @State private var visibleIndex = 0

    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0){
                BrandHeader(
                    title: "Before Starting",
                    topPadding: geo.size.height * 0.015
                )
                .padding(.horizontal, geo.size.width * 0.05)
                
                // Subtitle
                Text("For accurate results, you’ll need:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.top, geo.size.height * 0.015)
                    .padding(.bottom, geo.size.height * 0.015)
                    .padding(.horizontal, geo.size.width * 0.05)
                
        
                
                // Checklist
                VStack(spacing: 0) {
                    ForEach(titles.indices, id: \.self) { idx in
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.title3)
                                .foregroundColor(Color("BrandBlue"))
                                .frame(width: 24)
                            
                            Text(titles[idx])
                                .font(.body.weight(.semibold))
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.vertical, geo.size.height * 0.015)
                        .padding(.horizontal, geo.size.width * 0.05)
                        .opacity(visibleIndex >= idx + 1 ? 1 : 0)
                        .animation(.easeIn(duration: 0.5), value: visibleIndex)
                        
                        Divider()
                            .opacity(visibleIndex >= idx + 1 ? 1 : 0)
                            .animation(.easeIn(duration: 0.5), value: visibleIndex)
                    }
                }
                
                Spacer()
                
                // Next button
                if visibleIndex > titles.count {
                    NavigationLink(destination: DeviceSettingsView()) {
                        PrimaryButton(title: "I’m Ready To Begin")
                    }
                    .padding(.horizontal, geo.size.width * 0.1)
                    .padding(.bottom,
                             geo.safeAreaInsets.bottom > 0
                               ? geo.safeAreaInsets.bottom
                               : geo.size.height * 0.03
                    )
                    .transition(.opacity)
                    .animation(.easeIn(duration: 0.5), value: visibleIndex)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                // staggered reveal every 1.5s
                visibleIndex = 0
                for i in 1...titles.count + 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 1.5) {
                        withAnimation {
                            visibleIndex = i
                        }
                    }
                }
            }
        }
        // Inline nav-bar & accessibility
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ScreenReader(textToSpeak:
                    "Before Starting. For accurate results, you’ll need: a room large enough to stand eight feet from your device; good lighting; a quiet environment; your regular glasses or contacts if you wear any; and to speak clearly into microphone."
                )
            }
        }
        .tint(.black)
    }
}

struct BeforeStartingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BeforeStartingView()
        }
    }
}
