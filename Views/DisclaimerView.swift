import SwiftUI

struct DisclaimerView: View {
    var body: some View {
        VStack {
            // progress bar
            ProgressView(value: 0.25)
                .progressViewStyle(.linear)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Please read and accept before continuing.")
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    Text("Medical Disclaimer")
                        .fontWeight(.semibold)
                    Text("""
                    This test is a screening tool and not a replacement for a comprehensive eye exam. Please continue regular check‑ups with a licensed eye care professional.
                    """)
                        .foregroundColor(.secondary)
                    
                    Text("Agreement")
                        .fontWeight(.semibold)
                    Text("By tapping “I Agree,” you confirm that you accept our ")
                        + Text("Terms of Use").underline()
                        + Text(", ")
                        + Text("Privacy Policy").underline()
                        + Text(", ")
                        + Text("Service Agreement").underline()
                        + Text(", ")
                        + Text("Notice of Privacy Practices").underline()
                }
                .padding()
            }
            
            Button("I Agree") {
                // handle agreement action
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(30)
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .navigationTitle("Visual Acuity Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "speaker.wave.2.fill")
            }
        }
    }
}
