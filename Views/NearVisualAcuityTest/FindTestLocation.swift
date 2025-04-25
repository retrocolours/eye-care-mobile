//
//  FindTestLocation.swift
//  visual-acuity-test
//
//  Created by acidgypsycat on 2025-04-25.
//


import SwiftUI

struct FindTestLocationView: View {
    var body: some View {
        VStack(spacing: 0) {
            // 1) Progress bar (small filled portion—adjust value as needed)
            ProgressView(value: 0.3)
                .progressViewStyle(.linear)

            // 2) Scrollable content
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Spacer().frame(height: 16)

                    // Illustration centered
                    Image("brightness")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 250)
                        .frame(maxWidth: .infinity)

                    // Heading
                    Text("Find Test Location")
                        .font(.title2.weight(.semibold))
                        .foregroundColor(Color("BrandBlue"))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 24)

                    // Numbered steps
                    VStack(spacing: 0) {
                        // Step 1: two-line item
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "1.circle")
                                .font(.title3)
                                .foregroundColor(Color("BrandBlue"))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Find a bright, comfortable spot")
                                Text("You can sit or stand during the test")
                            }
                            .font(.body)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 12)

                        Divider()

                        // Step 2: single-line item
                        HStack(spacing: 12) {
                            Image(systemName: "2.circle")
                                .font(.title3)
                                .foregroundColor(Color("BrandBlue"))
                            Text("Point camera at closest lamp or window")
                                .font(.body)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 12)

                        Divider()
                    }
                    .padding(.horizontal, 24)

                    Spacer()
                }
            }

            // 3) Bottom button
            NavigationLink("Start Brightness Checking") {
                // TODO: push your actual brightness-checking view here
                Text("Brightness Checking")
                    .navigationTitle("Visual Acuity Test")
            }
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color("BrandBlue"))
            .cornerRadius(28)
            .padding(.horizontal, 24)
            .padding(.bottom, 16)
        }
        // 4) Nav-bar styling
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Visual Acuity Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "speaker.wave.2.fill")
            }
        }
    }
}

struct FindTestLocationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FindTestLocationView()
        }
    }
}
