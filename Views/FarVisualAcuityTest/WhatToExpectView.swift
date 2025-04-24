//
//  WhatToExpectView.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct WhatToExpectView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var visibleIndex = 0
    let statements = [
        "Make sure you are in a well-lit room.",
        "Remove your glasses or contact lenses.",
        "Position yourself 8 feet away from your screen.",
        "Follow the instructions for each part of the test."
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            FarNavBar()
            ProgressView(value: 0.25)
                .progressViewStyle(.linear)
                .padding(.top)
            Spacer(minLength: 32)
            Text("What to Expect")
                .font(.title2.weight(.semibold))
                .padding(.bottom, 16)
            VStack(alignment: .leading, spacing: 16) {
                ForEach(statements.indices, id: \.self) { idx in
                    if visibleIndex >= idx + 1 {
                        HStack(alignment: .top) {
                            Text("\(idx + 1).")
                                .font(.headline)
                                .foregroundColor(Color("BrandBlue"))
                                .frame(width: 24, alignment: .trailing)
                            Text(statements[idx])
                                .font(.body)
                                .transition(.opacity)
                        }
                        .opacity(visibleIndex >= idx + 1 ? 1 : 0)
                    }
                }
            }
            .padding(.horizontal, 32)
            Spacer()
        }
        .hideBackButton()
        .onAppear {
            visibleIndex = 0
            for i in 1...statements.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.7) {
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
