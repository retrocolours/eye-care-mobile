//
//  StepCountingShoeSize.swift
//  visual-acuity-test
//
//  Created by Ryan Burns on 2025-05-05.
//

import SwiftUI

enum Gender: String, CaseIterable {
    case Men = "Men"
    case Women = "Women"
}

enum SizeSystem: String, CaseIterable {
    case US = "US"
    case UK = "UK"
}

struct StepCountingShoeSize: View {
    @State private var selectedGender: Gender = .Men
    @State private var selectedSizeSystem: SizeSystem = .US
    @State private var selectedShoeSize: String = "US 6.0"

    private var shoeSizes: [Gender: [SizeSystem: [String]]] = [
        .Men: [
            .US: ["US 6.0", "US 7.0", "US 8.0", "US 9.0", "US 10.0"],
            .UK: ["UK 5.5", "UK 6.5", "UK 7.5", "UK 8.5", "UK 9.5"]
        ],
        .Women: [
            .US: ["US 5.0", "US 6.0", "US 7.0", "US 8.0", "US 9.0"],
            .UK: ["UK 3.0", "UK 4.0", "UK 5.0", "UK 6.0", "UK 7.0"]
        ]
    ]

    private var filteredShoeSizes: [String] {
        shoeSizes[selectedGender]?[selectedSizeSystem] ?? []
    }

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                ProgressBar(fillAmount: 0.5)
                VStack(alignment: .leading, spacing: 0) {
                    Image("sneakers")
                        .resizable()
                        .scaledToFit()
                        .frame(
                            maxWidth: geo.size.width * 0.95,
                            maxHeight: geo.size.height * 0.4
                        )
                        .clipped()
                        .padding(.horizontal, geo.size.width * 0.05)
                        .padding(.vertical, geo.size.height * 0.025)
                    BrandHeader(title: "What's Your Shoe Size?", topPadding: 0)
                    Text("Select your size to get accurate steps:")
                        .font(.callout.weight(.light))
                        .minimumScaleFactor(0.8)
                        .foregroundColor(Color("GreyText"))
                        .padding(.vertical, geo.size.height * 0.015)

                    // --- Gender Picker ---
                    Text("Gender")
                        .font(.footnote)
                        .foregroundColor(Color("GreyText"))
                        .padding(.top, geo.size.height * 0.01)
                    Picker("Gender", selection: $selectedGender) {
                        ForEach(Gender.allCases, id: \ .self) { gender in
                            Text(gender.rawValue).tag(gender)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.bottom, geo.size.height * 0.015)

                    // --- Size System Picker ---
                    Text("Size")
                        .font(.footnote)
                        .foregroundColor(Color("GreyText"))
                    Picker("Size System", selection: $selectedSizeSystem) {
                        ForEach(SizeSystem.allCases, id: \ .self) { system in
                            Text(system.rawValue).tag(system)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.bottom, geo.size.height * 0.015)

                    // --- Shoe Size Dropdown ---
                    HStack {
                        Picker("Shoe Size", selection: $selectedShoeSize) {
                            ForEach(filteredShoeSizes, id: \ .self) { size in
                                Text(size).foregroundColor(.black).tag(size)
                            }
                        }
                        .pickerStyle(.menu)
                        .frame(maxWidth: .infinity)
                        .tint(.black)
                        .onChange(of: selectedGender) {
                            if let first = filteredShoeSizes.first {
                                selectedShoeSize = first
                            }
                        }
                        .onChange(of: selectedSizeSystem) {
                            if let first = filteredShoeSizes.first {
                                selectedShoeSize = first
                            }
                        }
                    }
                    .background(Color("LightGrey"))
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .cornerRadius(8)
                    .padding(.vertical, geo.size.height * 0.01)
                    

                    Spacer()
                }
                .padding(.horizontal, geo.size.width * 0.05)
                HStack(spacing: geo.size.width * 0.05) {
                    NavigationLink(destination: SetYourDevice3()) {
                        PrimaryButton(title: "Back", inverted: true)
                    }
                    NavigationLink(destination: CountYourSteps()) {
                        PrimaryButton(title: "Next")
                    }
                }
                .padding(.horizontal, geo.size.width * 0.05)
                .padding(.bottom, geo.safeAreaInsets.bottom > 0 ? geo.safeAreaInsets.bottom : geo.size.height * 0.03)
            }
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
struct StepCountingShoeSize_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StepCountingShoeSize()
        }
    }
}
