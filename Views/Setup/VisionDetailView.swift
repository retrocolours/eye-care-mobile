
//
//  VisionDetailView.swift
//  visual-acuity-test
//
//  Created by acidgypsycat on 2025-04-23.



import SwiftUI

enum TestPart: String, CaseIterable, Identifiable {
    case near     = "Near Vision"
    case distance = "Distance Vision\n(requires 8-foot space)"
    
    var id: String { rawValue }
    var imageName: String {
        switch self {
        case .near:     return "man"
        case .distance: return "far"
        }
    }
}

struct VisionDetailView: View {
    let part: TestPart
    @State private var showFar = false
    @State private var navigateToChecklist = false

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                // 1) Push content just under the nav‐bar divider
//                Spacer(minLength: geo.safeAreaInsets.top + 4)
                
                // 2) Section heading
                BrandHeader(
                    title: "Your Visual Acuity Test includes two parts:",
                    topPadding: 0
                )
                .padding(.top, geo.safeAreaInsets.top)

                .padding(.horizontal, geo.size.width * 0.05)
                
                // 3) Near-vision illustration + label
                Image(part.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        maxWidth: geo.size.width * 0.8,
                        maxHeight: geo.size.height * 0.3
                    )
                    .clipped()
                    .padding(.top, geo.size.height * 0.02)
                
                Text(part.rawValue)
                    .font(.headline.weight(.semibold))
                    .foregroundColor(Color("BrandBlue"))
                    .padding(.top, geo.size.height * 0.01)
                
                // 4) Far-vision illustration and label, fades in
                if showFar {
                    Image(TestPart.distance.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(
                            maxWidth: geo.size.width * 0.8,
                            maxHeight: geo.size.height * 0.3
                        )
                        .clipped()
                        .padding(.top, geo.size.height * 0.02)
                    
                    Text(TestPart.distance.rawValue)
                        .font(.headline.weight(.semibold))
                        .foregroundColor(Color("BrandBlue"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, geo.size.width * 0.05)
                        .padding(.top, geo.size.height * 0.01)
                }
                
                Spacer()
                
                // 5) Hidden link to advance when animation completes
                NavigationLink(
                    destination: BeforeStartingView(),
                    isActive: $navigateToChecklist
                ) {
                    EmptyView()
                }
                .hidden()
                .frame(width: 0, height: 0)
                .padding(.bottom, geo.safeAreaInsets.bottom > 0
                         ? geo.safeAreaInsets.bottom
                         : geo.size.height * 0.03)
            }
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                // fade in far vision after 2s
                withAnimation(.easeIn(duration: 0.6).delay(2.0)) {
                    showFar = true
                }
                // then auto-navigate at ~2.6s
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.6) {
                    navigateToChecklist = true
                }
            }
        }
        // 6) Single, inline nav-bar from parent
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ScreenReader(
                    textToSpeak:
                    """
                    Your Visual Acuity Test includes two parts: Near Vision, then Distance Vision which requires eight-foot space.
                    """
                )
            }
        }
        .tint(.black)
    }
}

struct VisionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VisionDetailView(part: .near)
        }
    }
}


