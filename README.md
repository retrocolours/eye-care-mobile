//
//  README.md
//  visual-acuity-test
//
//  Created by acidgypsycat on 2025-05-08.
//

# Visual Acuity Test

A SwiftUI iOS app that guides users through a simple self-screening vision check: a medical disclaimer, two-part near/distance test, pre-test checklist, device setup (brightness, microphone, camera) with animated guidance and full accessibility support.

---

## Features

- **Onboarding & Disclaimer**
- **Two-part vision test**
  - Near-vision check (interactive letters)
  - Distance-vision check (8-foot setup)
- **Pre-test checklist**: lighting, environment, glasses/contacts, quiet room, etc.
- **Device calibration**: animated brightness check, microphone & camera permissions
- **Animated guidance** for brightness & volume
- **Accessibility**: VoiceOver announcements, large tap targets, dynamic type
- **Adaptive layout** via `GeometryReader` (percentage-based sizing)

---

## Requirements

- Xcode 15+
- iOS 17+
- Swift 5.9
- SwiftUI
- (Optional) SwiftData for future persistence

---

## Getting Started

```bash
# 1. Clone
git clone https://github.com/retrocolours/eye-care-mobile.git
cd visual-acuity-test

# 2. Open in Xcode
open VisualAcuityTest.xcodeproj

# 3. Run
⌘R on a simulator or device
