//
//  TrackpadView.swift
//  System Settings
//
//  System Settings > Trackpad
//

import SwiftUI

struct TrackpadView: View {
    @State private var selectedTab = "Point & Click"
    let options = ["Point & Click", "Scroll & Zoom", "More Gestures"]
    
    var body: some View {
        CustomForm(title: "Trackpad") {
            Section {
                Text("Tracking speed")
                Text("Click")
                Text("Force Click and haptic feedback")
                Text("Look up & data detectors")
                Text("Secondary click")
                Text("Tap to click")
            } footer: {
                HStack {
                    Button("Set Up Bluetooth Trackpad…") {}
                    HelpButton(topicID: "mchlp1226")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .safeAreaInset(edge: .top) {
            ZStack {
                RoundedRectangle(cornerRadius: 3.0)
                    .foregroundStyle(.fill.opacity(0.15))
                    .frame(width: 220, height: 140)
                    .offset(x: -115, y: -16)
                VStack {
                    if let asset = NSImage.asset(path: "/System/Library/ExtensionKit/Extensions/TrackpadExtension.appex", name: "Trackpad") {
                        Image(nsImage: asset)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 140)
                    }
                    Picker("", selection: $selectedTab) {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(.palette)
                }
            }
            .frame(maxWidth: .infinity)
            .background(.background)
        }
    }
}

#Preview {
    TrackpadView()
}
