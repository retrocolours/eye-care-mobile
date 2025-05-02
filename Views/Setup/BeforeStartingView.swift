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
            VStack(spacing: 0) {
                BrandHeader(
                    title: "Before Starting",
                    topPadding: geo.size.height * 0.015
                )
                .padding(.horizontal, geo.size.width * 0.05)
                
                Text("For accurate results, you’ll need:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.top, geo.size.height * 0.015)
                    .padding(.horizontal, geo.size.width * 0.05)
                
                VStack(spacing: 0) {
                    ForEach(titles.indices, id: \.self) { idx in
                        // each row appears once visibleIndex >= idx+1
                        HStack(alignment: .top, spacing: 12) {
                            ZStack {
                                Circle()
                                    .stroke(Color("BrandBlue"), lineWidth: 1)
                                    .frame(width: 30, height: 30)
                                Text("\(idx+1)")
                                    .font(.headline)
                                    .foregroundColor(Color("BrandBlue"))
                            }
                            Text(titles[idx])
                                .font(.body)
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
                
                if visibleIndex > titles.count {
                    NavigationLink(destination: DeviceSettingsView()) {
                        PrimaryButton(title: "I’m Ready to Begin")
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
            .opacity(visibleIndex > 0 ? 1 : 0) // fade entire screen in
            .onAppear {
                // stagger each reveal at 1.5s intervals
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
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ScreenReader(textToSpeak:
                    "Before Starting. For accurate results, you’ll need: a room large enough to stand eight feet from your device; good lighting; a quiet environment; your regular glasses or contacts if you wear any; and to speak clearly into the microphone."
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
