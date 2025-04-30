//
//  VisualAidView.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-04-24.
//

import SwiftUI

struct VisualAidView: View {
    @State private var selectedEyewear: EyewearOption? = nil
    
    enum EyewearOption: String, CaseIterable, Identifiable {
        case glasses = "Glasses"
        case contacts = "Contacts"
        case none = "None"
        var id: String { self.rawValue }
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                ProgressBar(fillAmount: 0.3)
                Image("eyeglasses-and-contact-lenses")
                    .resizable()
                    .scaledToFit()
                    .frame(
                        maxWidth: geo.size.width * 0.35,
                        maxHeight: geo.size.height * 0.25
                    )
                    .clipped()
                    .padding(.horizontal, geo.size.width * 0.05)
                BrandHeader(title:"Prepare for Distance Vision Test", topPadding: 0)
                Group {
                    Text("Select eyewear you normally use for viewing ")
                        .font(.callout.weight(.light))
                    + Text("far away")
                        .font(.callout.weight(.bold))
                    + Text(":")
                        .font(.callout.weight(.light))
                }
                .minimumScaleFactor(0.8)
                .padding(.horizontal, geo.size.width * 0.05)
                .padding(.vertical)
                .foregroundColor(Color("GreyText"))

                VStack(spacing: 12) {
                    ForEach(EyewearOption.allCases) { option in
                        NavigationLink(destination: {
                            switch option {
                            case .glasses:
                                GlassesSelected()
                            case .contacts:
                                ContactsSelected()
                            case .none:
                                SetYourDevice()
                            }
                        }) {
                            HStack {
                                Text(option.rawValue)
                                    .foregroundColor(selectedEyewear == option ? .white : .primary)
                                    .font(.body)
                                Spacer()
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 24, height: 24)
                                    Circle()
                                        .stroke(selectedEyewear == option ? Color("BrandBlue") : Color.gray.opacity(0.3), lineWidth: 2)
                                        .frame(width: 24, height: 24)
                                    if selectedEyewear == option {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(Color("BrandBlue"))
                                            .font(.system(size: 14, weight: .bold))
                                    }
                                }
                            }
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(selectedEyewear == option ? Color("BrandBlue") : Color("RadioBackground"))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(selectedEyewear == option ? Color("BrandBlue") : Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                        .simultaneousGesture(TapGesture().onEnded { selectedEyewear = option })
                    }
                }
                .padding(.horizontal, geo.size.width * 0.05)
            }
            .background(Color(.systemBackground))
            .edgesIgnoringSafeArea(.bottom)
            Spacer()
        }
        // Navigation Bar Styling
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Distance Vision Test")
        .toolbar {
            // Speaker icon
            ToolbarItem(placement: .navigationBarTrailing) {
                ScreenReader(textToSpeak: "Implement this!")
            }
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
