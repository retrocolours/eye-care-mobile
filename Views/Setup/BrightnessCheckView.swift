//
//  BrightnessCheckView.swift
//  visual-acuity-test
//
//  Created by acidgypsycat on 2025-05-05.
//

import SwiftUI

struct BrightnessCheckView: View {
    private let phoneStates = [
        "brightness-dark",     // Too Dark
        "brightness-light",    // Too Bright
        "brightness-ideal"     // Perfect Lighting
    ]
    private let gaugeStates = [
        "meter-dark",
        "meter-light",
        "meter-ideal"
    ]
    private let titles = [
        "Too Dark",
        "Too Bright",
        "Perfect Lighting"
    ]
    private let subtitles = [
        "Please move to a brighter area",
        "Please find a less bright space",
        """
        Stay in this spot for your test
        You’re ready to proceed
        """
    ]

    // Animation state
    @State private var step = 0    // 0…2

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                // Progress bar at 40%
                ProgressBar(fillAmount: 0.4)
                    .frame(height: 4)

                // Section header
                BrandHeader(
                    title: "Brightness Checking",
                    topPadding: geo.size.height * 0.02
                )
                .padding(.horizontal, geo.size.width * 0.05)

                // Prompt
                Text("Reading Light Level…")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.top, geo.size.height * 0.015)

                // Phone illustration
                Image(phoneStates[step])
                    .resizable()
                    .scaledToFit()
                    .frame(
                        maxWidth: geo.size.width * 0.6,
                        maxHeight: geo.size.height * 0.3
                    )
                    .frame(maxWidth: .infinity)
                    .padding(.top, geo.size.height * 0.015)

                // Gauge illustration
                Image(gaugeStates[step])
                    .resizable()
                    .scaledToFit()
                    .frame(
                        maxWidth: geo.size.width * 0.5,
                        maxHeight: geo.size.height * 0.2
                    )
                    .frame(maxWidth: .infinity)
                    .padding(.top, geo.size.height * 0.02)

                // Title + Subtitle
                VStack(spacing: geo.size.height * 0.005) {
                    Text(titles[step])
                        .font(.title3.weight(.semibold))
                        .foregroundColor(Color("BrandBlue"))
                        .multilineTextAlignment(.center)
                    Text(subtitles[step])
                        .font(.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, geo.size.width * 0.1)
                .padding(.top, geo.size.height * 0.015)
                .animation(.easeInOut(duration: 1.0), value: step)

                Spacer()

                // Proceed button, only enabled on last step, connects to FarVisualAcuityTest. In the future reconnect to NearVisualAcuityTest
                NavigationLink(destination: FarStartView()) {
                    PrimaryButton(title: "Proceed")
                }
                .disabled(step < phoneStates.count - 1)
                .opacity(step == phoneStates.count - 1 ? 1 : 0.4)
                .padding(.horizontal, geo.size.width * 0.1)
                .padding(
                  .bottom,
                  geo.safeAreaInsets.bottom > 0
                    ? geo.safeAreaInsets.bottom
                    : geo.size.height * 0.03
                )
                .animation(.easeIn(duration: 0.5), value: step)
            }
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                // schedule each state at 2.5s intervals
                for i in 1..<phoneStates.count {
                    let delay = Double(i) * 2.5
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            step = i
                        }
                    }
                }
            }
        }
        // Inline nav + accessibility
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ScreenReader(textToSpeak:
                  "Now checking ambient light. Follow on-screen prompts and tap Proceed when you see Perfect Lighting."
                )
            }
        }
        .tint(.black)
    }
}

struct BrightnessCheckView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BrightnessCheckView()
        }
    }
}
