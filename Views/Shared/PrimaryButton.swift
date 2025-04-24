import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void
    var isEnabled: Bool = true
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isEnabled ? Color("BrandBlue") : Color.gray.opacity(0.5))
                .cornerRadius(12)
                .opacity(isEnabled ? 1 : 0.7)
        }
        .disabled(!isEnabled)
        .padding(.horizontal)
        .padding(.bottom, 24)
        .accessibilityLabel(title)
    }
}

#Preview {
    VStack {
        PrimaryButton(title: "Continue", action: {})
        PrimaryButton(title: "Disabled", action: {}, isEnabled: false)
    }
    .background(Color(.systemBackground))
}
