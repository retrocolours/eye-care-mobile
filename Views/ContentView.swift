import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Spacer()
                
                // Large icon
                Image(systemName: "doc.text.viewfinder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.blue.gradient)
                
                // Title & estimated time
                Text("Visual Acuity Test")
                    .font(.title2)
                    .fontWeight(.semibold)
                Label("8 min", systemImage: "clock")
                    .foregroundColor(.secondary)
                
                // Description
                Text("This vision test will evaluate how well you can see both up close and at a distance.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                // Navigation button
                NavigationLink {
                    DisclaimerView()
                } label: {
                    Text("Start")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                .padding(.horizontal)
            }
            .navigationTitle("Visual Acuity Test")
            .toolbar {
                // audio icon on the right
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "speaker.wave.2.fill")
                }
            }
        }
    }
}
