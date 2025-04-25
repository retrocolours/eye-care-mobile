//
//  WhatToExpectView.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct WhatToExpectView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var visibleIndex = 0
    let steps = [
        "Place your phone on a table",
        "Measure and Stand 8 feet away",
        "Cover your eye gently",
        "Letters appear on the screen",
        "Say each letter out loud",
        "Repeat as they get smaller",
        "Switch eyes when prompted"
    ]
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                ProgressBar(fillAmount: 0.2)
                BrandHeader(title: "What to Expect during your Distance Vision Test", topPadding: geo.size.height * 0.04)
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(steps.indices, id: \.self) { idx in
                        if visibleIndex >= idx + 1 {
                            HStack(alignment: .center) {
                                ZStack {
                                    Circle()
                                        .stroke(Color("BrandBlue"), lineWidth: 1)
                                        .frame(width: 30, height: 30)
                                    Text("\(idx + 1)")
                                        .font(.headline)
                                        .foregroundColor(Color("BrandBlue"))
                                }
                                Text(steps[idx])
                                    .font(.body.weight(.semibold))
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.leading)
                                    .transition(.opacity)
                                    .padding(.leading, geo.size.width * 0.025)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 16)
                            .opacity(visibleIndex >= idx + 1 ? 1 : 0)
                            .animation(.easeIn(duration: 0.5), value: visibleIndex)
                            Divider()
                        }
                    }
                }
                .padding(.horizontal, 16)
                if visibleIndex > steps.count {
                    Text("Tip: Take your time. There's no rush.")
                        .font(.body)
                        .foregroundColor(Color("BrandBlue"))
                        .transition(.opacity)
                        .padding(.top, geo.size.height * 0.02)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
                if visibleIndex > steps.count {
                    NavigationLink(destination: VisualAidView()) {
                        PrimaryButton(title: "I Understand")
                    }
                    .transition(.opacity)
                    .padding(.horizontal, geo.size.width * 0.1)
                    .padding(.bottom, geo.safeAreaInsets.bottom > 0 ? geo.safeAreaInsets.bottom : geo.size.height * 0.03)
                }
            }

        }    
        // Navigation Bar Styling
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Distance Vision Test")
        .toolbar {
            // Speaker icon
            ToolbarItem(placement: .navigationBarTrailing) {
                ScreenReader(textToSpeak: "What to Expect during your Distance Vision Test... 1. Place your phone on a table... 2. Measure and Stand 8 feet away... 3. Cover your eye gently... 4. Letters appear on the screen... 5. Say each letter out loud... 6. Repeat as they get smaller... 7. Switch eyes when prompted... Tip: Take your time. There's no rush.")
            }
        }
        .onAppear {
            visibleIndex = 0
            for i in 1...steps.count + 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 1.5) {
                    withAnimation(.easeIn(duration: 0.5)) {
                        visibleIndex = i
                    }
                }
            }
        }
    }
}

// Preview
struct WhatToExpectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WhatToExpectView()
        }
    }
}
