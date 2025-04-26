//
//  ScreenReader.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-25.
//

import SwiftUI
import AVFoundation

struct ScreenReader: View {
    let synthesizer = AVSpeechSynthesizer()
    var textToSpeak: String
       
       var body: some View {
           Button(action: {
               let utterance = AVSpeechUtterance(string: textToSpeak)
               utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
               synthesizer.speak(utterance)
           }) {
               Image(systemName: "speaker.wave.2")
                   .foregroundColor(.primary)
                   .fontWeight(.bold)
           }
       }
   }

#Preview {
    ScreenReader(textToSpeak: "Hey Professor Solo, you are crushing this app!")
}
