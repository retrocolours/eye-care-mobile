

import SwiftUI

enum TestPart: String, CaseIterable, Identifiable {
    case near     = "Near Vision"
    case distance = "Distance Vision\n(requires 8-foot space)"
    
    var id: String { rawValue }

    /// map to asset names
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

    var body: some View {
        VStack(spacing: 0) {
            NavBar(title: "Near Nav")
            // — Progress Bar at 50%
            ProgressView(value: 0.5)
                .progressViewStyle(.linear)

            ScrollView {
                VStack(spacing: 24) {
                    // — Section Heading
                    Text("Your Visual Acuity Test includes two parts:")
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(Color("BrandBlue"))
                        .multilineTextAlignment(.center)
                        .padding(.top, 16)
                        .padding(.horizontal, 24)

                    // — Near Vision Illustration
                    Image(part.imageName)              // "man"
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 250)

                    // — Label for Near Vision
                    Text(part.rawValue)                // "Near Vision"
                        .font(.headline.weight(.semibold))
                        .foregroundColor(Color("BrandBlue"))
                        .padding(.top, 8)

                    // — Far Vision appears after delay
                    if showFar {
                        Image("far")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 250)

                        Text(TestPart.distance.rawValue)  // "Distance Vision\n(requires 8-foot space)"
                            .font(.headline.weight(.semibold))
                            .foregroundColor(Color("BrandBlue"))
                            .multilineTextAlignment(.center)
                            .padding(.top, 8)
                    }

                    Spacer()
                }
                .padding(.horizontal, 24)
            }
        }
        // — Nav Bar styling (inline + underline setup assumed in App.init)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
    
        .onAppear {
            // Fade in the far-vision image & label after a delay, need to adjust potentially
            withAnimation(.easeIn(duration: 0.6).delay(2.0)) {
                showFar = true
            }
        }
    }
}

struct VisionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VisionDetailView(part: .near)
        }
    }
}
