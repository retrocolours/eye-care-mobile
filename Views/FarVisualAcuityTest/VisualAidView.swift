//
//  VisualAidView.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct VisualAidView: View {
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                ProgressBar(fillAmount: 0.3)
                Image("eyeglasses-and-contact-lenses")
                    .resizable()
                    .scaledToFit()
                    .frame(
                        maxWidth: geo.size.width * 0.35,
                        maxHeight: geo.size.height * 0.35
                    )
                    .clipped()
                    .padding(.horizontal, geo.size.width * 0.05)
                    .padding(.vertical, geo.size.width * 0.05)
                BrandHeader(title:"Prepare for Distance Vision Test", topPadding: 0)
            }
            .background(Color(.systemBackground))
            .edgesIgnoringSafeArea(.bottom)
            // Navigation Link
//            NavigationLink(destination: VisualAidView(), isActive: $navigate) {
//                EmptyView()
//            }
//            .hidden()
        }
    }
}

// Preview
struct VisualAidView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VisualAidView()
        }
    }
}
