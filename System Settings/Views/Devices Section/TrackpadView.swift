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
    @State private var trackingSpeed = 3.0
    @State private var click = 1.0
    @State private var forceClickHaptic = true
    @State private var lookUpGesture = "GNAME_LOOKUP_FORCECLICK"
    @State private var lookUpTap = true
    @State private var secondaryClick = "GNAME_SECONDARYCLICK_2F"
    @State private var tapToClick = false
    let options = ["Point & Click", "Scroll & Zoom", "More Gestures"]
    let lookUpOptions = ["GNAME_OFF", "GNAME_LOOKUP_FORCECLICK", "GNAME_LOOKUP_T3FAP"]
    let secondaryOptions = ["GNAME_OFF", "GNAME_SECONDARYCLICK_2F", "GNAME_SECONDARYCLICK_BOTTOM_RIGHT_CORNER", "GNAME_SECONDARYCLICK_BOTTOM_LEFT_CORNER"]
    let secondaryTapOptions = ["GNAME_OFF", "GNAME_SECONDARYTAP_2F", "GNAME_SECONDARYCLICK_BOTTOM_RIGHT_CORNER", "GNAME_SECONDARYCLICK_BOTTOM_LEFT_CORNER"]
    
    var body: some View {
        CustomForm(title: "Trackpad") {
            Section {
                switch selectedTab {
                case "Scroll & Zoom":
                    EmptyView()
                case "More Gestures":
                    EmptyView()
                default:
                    VStack(alignment: .trailing) {
                        Slider(
                            value: $trackingSpeed,
                            in: 0...9,
                            step: 1
                        ) {
                            Text("Tracking speed".localized(using: table))
                        }
                        HStack {
                            Text("Slow".localized(using: table))
                            Spacer()
                            Text("Fast".localized(using: table))
                        }
                        .frame(width: 240)
                        .font(.caption)
                    }
                    VStack(alignment: .trailing) {
                        Slider(
                            value: $click,
                            in: 0...2,
                            step: 1
                        ) {
                            Text("Click".localized(using: table))
                        }
                        HStack {
                            Text("Light".localized(using: table))
                            Spacer()
                            Text("Medium".localized(using: table))
                            Spacer()
                            Text("Firm".localized(using: table))
                        }
                        .frame(width: 240)
                        .font(.caption)
                    }
                    Toggle(isOn: $forceClickHaptic) {
                        Text("GNAME_FORCE_CLICK".localized(using: table))
                        Text("GNAME_FORCE_CLICK_LABEL".localized(using: table))
                    }
                    if forceClickHaptic {
                        Picker("GNAME_LOOKUP".localized(using: table), selection: $lookUpGesture) {
                            ForEach(lookUpOptions, id: \.self) { option in
                                Text(option.localized(using: table))
                            }
                        }
                    } else {
                        Toggle(isOn: $lookUpTap) {
                            Text("GNAME_LOOKUP".localized(using: table))
                            Text("GNAME_DEEP_CLICK_LABEL".localized(using: table))
                        }
                    }
                    Picker("GNAME_SECONDARYCLICK".localized(using: table), selection: $secondaryClick) {
                        ForEach(tapToClick ? secondaryTapOptions : secondaryOptions, id: \.self) { option in
                            Text(option.localized(using: table))
                        }
                    }
                    Toggle(isOn: $tapToClick) {
                        Text("GNAME_CLICK".localized(using: table))
                        Text("GNAME_CLICK_LABEL".localized(using: table))
                    }
                    .onChange(of: tapToClick) {
                        if secondaryClick == "GNAME_SECONDARYCLICK_2F" || secondaryClick == "GNAME_SECONDARYTAP_2F" {
                            secondaryClick = tapToClick ? "GNAME_SECONDARYTAP_2F" : "GNAME_SECONDARYCLICK_2F"
                        }
                    }
                }
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
                    .offset(x: -115, y: -22)
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
                    .padding(.vertical, 6)
                }
            }
            .frame(maxWidth: .infinity)
            .background(.background)
        }
    }
}

#Preview {
    TrackpadView()
        .frame(width: 500, height: 600)
}
