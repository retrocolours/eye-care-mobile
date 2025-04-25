
import SwiftUI

struct DisclaimerView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Content
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Headline
                    Text("Please read and accept before continuing.")
                        .font(.title3.weight(.semibold))
                        .foregroundColor(Color("BrandBlue"))
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 16)

                    // Medical Disclaimer section
                    Text("Medical Disclaimer")
                        .font(.headline.weight(.semibold))
                        .padding(.top, 8)

                    Text("""
                    This test is a screening tool and not a replacement for a comprehensive eye exam. Please continue regular check-ups with a licensed eye care professional.
                    """)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)

                    // Agreement section
                    Text("Agreement")
                        .font(.headline.weight(.semibold))
                        .padding(.top, 8)

                    (
                        Text("By tapping “I Agree,” you confirm that you accept our ")
                        + Text("Terms of Use").underline().foregroundColor(Color("BrandBlue"))
                        + Text(", ")
                        + Text("Privacy Policy").underline().foregroundColor(Color("BrandBlue"))
                        + Text(", ")
                        + Text("Service Agreement").underline().foregroundColor(Color("BrandBlue"))
                        + Text(", and ")
                        + Text("Notice of Privacy Practices").underline().foregroundColor(Color("BrandBlue"))
                        + Text(".")
                    )
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.primary)
                }
                .padding(.horizontal, 24)
            }

            Spacer()

            // I Agree button
            NavigationLink("I Agree") {
                VisionDetailView(part: TestPart.near)
            }

            .buttonStyle(.plain)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color("BrandBlue"))
            .foregroundColor(.white)
            .cornerRadius(28)
            .padding(.horizontal, 24)
            .padding(.bottom, 16)
        }
        // Navigation Bar Styling
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
        .toolbar {
            // Speaker icon
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "speaker.wave.2.fill")
                    .foregroundColor(.primary)
            }
        }
    }
}

// Preview
struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DisclaimerView()
        }
    }
}

