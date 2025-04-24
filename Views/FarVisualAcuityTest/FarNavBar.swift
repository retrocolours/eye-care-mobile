//
//  FarNavBar.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct FarNavBar: View {
    var onBack: (() -> Void)? = nil
    var onScreenReader: (() -> Void)? = nil

    var body: some View {
        NavBar(
            onBack: onBack,
            onScreenReader: onScreenReader,
            title: "Distance Vision Test"
        )
    }
}
