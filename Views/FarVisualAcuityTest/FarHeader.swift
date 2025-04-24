import SwiftUI

struct FarHeader: View {
    var onBack: (() -> Void)? = nil
    var onScreenReader: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            Button(action: {
                onBack?()
            }) {
                Image(systemName: "chevron.left")
                    .font(.title2.weight(.semibold))
                    .foregroundColor(.primary)
            }
            .accessibilityLabel("Back")
            
            Spacer()
            Text("Distance Vision Test")
                .font(.headline)
                .foregroundColor(.primary)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            Button(action: {
                onScreenReader?()
            }) {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            .accessibilityLabel("Screen Reader")
        }
        .padding([.horizontal, .top])
        .frame(height: 44)
        .background(Color(.systemBackground).opacity(0.95))
    }
}

#Preview {
    FarHeader()
}
