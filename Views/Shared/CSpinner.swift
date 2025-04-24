//
//  CSpinner.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct CSpinner: View {
    @State private var rotation: Double = 0
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // Background circle (optional, for contrast)
            Circle()
                .stroke(Color.gray.opacity(0.15), lineWidth: 6)
            // Foreground "C" arc
            Arc(startAngle: .degrees(60), endAngle: .degrees(0), clockwise: false)
                .stroke(Color("BrandBlue"), style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 1.2), value: rotation)
        }
        .onAppear {
            isAnimating = true
            rotation = 0
            animateSpinner()
        }
    }
    
    private func animateSpinner() {
        let duration = 1.1
        let customCurve = Animation.timingCurve(0.4, 0.0, 0.2, 1.0, duration: duration)
        withAnimation(customCurve) {
            rotation += 360
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            if isAnimating {
                animateSpinner()
            }
        }
    }
}

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.addArc(center: center, radius: radius, startAngle: startAngle - .degrees(90), endAngle: endAngle - .degrees(90), clockwise: clockwise)
        return path
    }
}

#Preview {
    CSpinner()
}
