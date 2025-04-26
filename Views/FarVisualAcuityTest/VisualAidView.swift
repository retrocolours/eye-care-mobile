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
                // Built-in navigation bar will be used instead of FarNavBar
                ProgressView(value: 0.25)
                    .progressViewStyle(.linear)
                    .padding(.top, geo.size.height * 0.02)
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
                Text("What to Expect during your Distance Vision Test")
                    .font(.title2.weight(.bold))
                    .minimumScaleFactor(0.7)
                    .lineLimit(2)
                    .padding(.vertical, geo.size.height * 0.04)
                    .foregroundColor(Color("BrandBlue"))
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

#Preview {
    VisualAidView()
}
