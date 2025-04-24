//
//  HideBackButton.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct HideBackButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
    }
}

extension View {
    func hideBackButton() -> some View {
        self.modifier(HideBackButton())
    }
}
