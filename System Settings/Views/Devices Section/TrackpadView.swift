//
//  TrackpadView.swift
//  System Settings
//
//  System Settings > Trackpad
//

import SwiftUI

struct TrackpadView: View {
    @State private var table = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/TrackpadExtension.appex")
    @State private var selectedTab = "Point & Click"
    let options = ["Point & Click", "Scroll & Zoom", "More Gestures"]
    
    var body: some View {
        CustomForm(title: "Trackpad") {
            Section {
                Text("Tracking speed".localized(using: table))
                Text("Click".localized(using: table))
                Text("GNAME_FORCE_CLICK".localized(using: table))
                Text("GNAME_LOOKUP".localized(using: table))
                Text("GNAME_SECONDARYCLICK".localized(using: table))
                Text("GNAME_CLICK".localized(using: table))
            } footer: {
                HStack {
                    Button("Set Up Bluetooth Trackpad…".localized(using: table)) {}
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
                            Text(option.localized(using: table))
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
        .frame(height: 600)
}
