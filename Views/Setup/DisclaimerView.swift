//
//  DisclaimerView.swift
//  visual-acuity-test
//
//  Created by acidgypsycat on 2025-04-22.



import SwiftUI

struct DisclaimerView: View {
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                Spacer(minLength: geo.safeAreaInsets.top)

                VStack(alignment: .leading, spacing: geo.size.height * 0.02) {
                    // Headline
                    Text("Please read and accept before continuing.")
                        .font(.title3.weight(.semibold))
                        .foregroundColor(Color("BrandBlue"))
                        .fixedSize(horizontal: false, vertical: true)

                    // Medical Disclaimer
                    Text("Medical Disclaimer")
                        .font(.headline.weight(.semibold))

                    Text("""
                    This test is a screening tool and not a replacement for a comprehensive eye exam. Please continue regular check-ups with a licensed eye care professional.
                    """)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)

                    // Agreement
                    Text("Agreement")
                        .font(.headline.weight(.semibold))

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
                }
                .padding(.horizontal, geo.size.width * 0.05)

                Spacer()

                // “I Agree” button
                NavigationLink(destination: VisionDetailView(part: .near)) {
                    PrimaryButton(title: "I Agree")
                }
                .padding(.horizontal, geo.size.width * 0.1)
                .padding(.bottom,
                         geo.safeAreaInsets.bottom > 0
                           ? geo.safeAreaInsets.bottom
                           : geo.size.height * 0.03
                )
            }
            .edgesIgnoringSafeArea(.bottom)
        }
       
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ScreenReader(
                    textToSpeak:
                    """
                    Please read and accept before continuing. Medical Disclaimer: This test is a screening tool and not a replacement for a comprehensive eye exam. Agreement: By tapping I Agree, you confirm that you accept our Terms of Use, Privacy Policy, Service Agreement, and Notice of Privacy Practices.
                    """
                )
            }
        }
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DisclaimerView()
        }
    }
}
