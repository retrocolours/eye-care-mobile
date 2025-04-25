

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
        VStack(spacing: 0) {
            // Progress bar
            ProgressView(value: 0.5)
                .progressViewStyle(.linear)

            ScrollView {
                VStack(spacing: 24) {
                    // Section heading
                    Text("Your Visual Acuity Test includes two parts:")
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(Color("BrandBlue"))
                        .multilineTextAlignment(.center)
                        .padding(.top, 16)
                        .padding(.horizontal, 24)

                    // Near vision illustration & label
                    Image(part.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 250)
                    Text(part.rawValue)
                        .font(.headline.weight(.semibold))
                        .foregroundColor(Color("BrandBlue"))
                        .padding(.top, 8)

                    // Far vision appears after delay
                    if showFar {
                        Image("far")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 250)
                        Text(TestPart.distance.rawValue)
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
        // Inline nav title and toolbar
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
        .toolbar {
         
            ToolbarItem(placement: .principal) {
                Text("Visual Acuity Test").font(.headline)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "speaker.wave.2.fill")
            }
        }
        // navigationDestination instead of hidden link, was getting 'depricated' issue
        .navigationDestination(isPresented: $navigateToChecklist) {
            BeforeStartingView()
        }
        // Animations
        .onAppear {
            // Fade in far vision after 2s
            withAnimation(.easeIn(duration: 0.6).delay(2.0)) {
                showFar = true
            }
            // Then auto-navigate ~0.6s later
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.6) {
                navigateToChecklist = true
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
