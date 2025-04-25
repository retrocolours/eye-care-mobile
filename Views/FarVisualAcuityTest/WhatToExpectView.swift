//
//  WhatToExpectView.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct WhatToExpectView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var navigate = false
    @State private var visibleIndex = 0
    let steps = [
        "Place your phone on a table",
        "Measure and Stand 8 feet away",
        "Cover your eye gently",
        "Letters appear on the screen",
        "Say each letter out loud",
        "Repeat as they get smaller",
        "Switch eyes when prompted"
    ]
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                FarNavBar()
                ProgressView(value: 0.25)
                    .progressViewStyle(.linear)
                    .padding(.top, geo.size.height * 0.02)
                BrandHeader(title: "What to Expect during your Distance Vision Test", topPadding: geo.size.height * 0.04)
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(steps.indices, id: \.self) { idx in
                        if visibleIndex >= idx + 1 {
                            HStack(alignment: .center) {
                                ZStack {
                                    Circle()
                                        .stroke(Color("BrandBlue"), lineWidth: 1)
                                        .frame(width: 30, height: 30)
                                    Text("\(idx + 1)")
                                        .font(.headline)
                                        .foregroundColor(Color("BrandBlue"))
                                }
                                Text(steps[idx])
                                    .font(.body.weight(.semibold))
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.leading)
                                    .transition(.opacity)
                                    .padding(.leading, geo.size.width * 0.025)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 16)
                            .opacity(visibleIndex >= idx + 1 ? 1 : 0)
                            .animation(.easeIn(duration: 0.5), value: visibleIndex)
                            Divider()
                        }
                    }
                }
                .padding(.horizontal, 16)
                if visibleIndex > steps.count {
                    Text("Tip: Take your time. There's no rush.")
                        .font(.body)
                        .foregroundColor(Color("BrandBlue"))
                        .transition(.opacity)
                        .padding(.top, geo.size.height * 0.02)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
                if visibleIndex > steps.count {
                    PrimaryButton(title: "I Understand") { navigate = true }
                        .transition(.opacity)
                        .padding(.horizontal, 16)
                        .padding(.bottom, geo.safeAreaInsets.bottom > 0 ? geo.safeAreaInsets.bottom : geo.size.height * 0.03)
                }
            }
            // Navigation Link
            NavigationLink(destination: VisualAidView(), isActive: $navigate) {
                EmptyView()
            }
            .hidden()

        }    
        .hideBackButton()
        .onAppear {
            visibleIndex = 0
            for i in 1...steps.count + 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 1.5) {
                    withAnimation(.easeIn(duration: 0.5)) {
                        visibleIndex = i
                    }
                }
            }
        }
    }
}

#Preview {
WhatToExpectView()
}
