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
    @State private var naturalScroll = true
    @State private var zoomGesture = true
    @State private var smartZoom = true
    @State private var rotate = true
    @State private var swipePages = "GNAME_NAVIGATION_EDGE"
    @State private var swipeFullscreen = "GNAME_DASHBOARD_H3FINGER"
    @State private var notificationCenter = true
    @State private var missionControl = "GNAME_MISSIONCONTROL_V3FINGER"
    @State private var appExpose = "GNAME_OFF"
    @State private var showDesktop = true
    let options = ["Point & Click", "Scroll & Zoom", "More Gestures"]
    let lookUpOptions = ["GNAME_OFF", "GNAME_LOOKUP_FORCECLICK", "GNAME_LOOKUP_T3FAP"]
    let secondaryOptions = ["GNAME_OFF", "GNAME_SECONDARYCLICK_2F", "GNAME_SECONDARYCLICK_BOTTOM_RIGHT_CORNER", "GNAME_SECONDARYCLICK_BOTTOM_LEFT_CORNER"]
    let secondaryTapOptions = ["GNAME_OFF", "GNAME_SECONDARYTAP_2F", "GNAME_SECONDARYCLICK_BOTTOM_RIGHT_CORNER", "GNAME_SECONDARYCLICK_BOTTOM_LEFT_CORNER"]
    let swipeOptions = ["GNAME_OFF", "GNAME_NAVIGATION_EDGE", "GNAME_NAVIGATION_SWIPE", "GNAME_NAVIGATION_BOTH"]
    let fullscreenOptions = ["GNAME_OFF", "GNAME_DASHBOARD_H3FINGER", "GNAME_DASHBOARD_H4FINGER"]
    let missionControlOptions = ["GNAME_OFF", "GNAME_MISSIONCONTROL_V3FINGER", "GNAME_MISSIONCONTROL_V4FINGER"]
    let exposeOptions = ["GNAME_OFF", "GNAME_APPEXPOSE_V3FINGER", "GNAME_APPEXPOSE_V4FINGER"]
    
    var body: some View {
        CustomForm(title: "Trackpad") {
            Section {
                switch selectedTab {
                case "Scroll & Zoom":
                    Toggle(isOn: $naturalScroll) {
                        Text("GNAME_SCROLL_NEW".localized(using: table))
                        Text("GNAME_SCROLL_LABEL".localized(using: table))
                    }
                    Toggle(isOn: $zoomGesture) {
                        Text("GNAME_PINCH".localized(using: table))
                        Text("GNAME_PINCH_LABEL".localized(using: table))
                    }
                    Toggle(isOn: $smartZoom) {
                        Text("GNAME_SMARTZOOM".localized(using: table))
                        Text("GNAME_SMARTZOOM_LABEL".localized(using: table))
                    }
                    Toggle(isOn: $rotate) {
                        Text("GNAME_ROTATE".localized(using: table))
                        Text("GNAME_ROTATE_LABEL".localized(using: table))
                    }
                case "More Gestures":
                    Picker("GNAME_NAVIGATION".localized(using: table), selection: $swipePages){
                        ForEach(swipeOptions, id: \.self) { option in
                            Text(option.localized(using: table))
                        }
                    }
                    Picker("GNAME_DASHBOARD".localized(using: table), selection: $swipeFullscreen){
                        ForEach(fullscreenOptions, id: \.self) { option in
                            Text(option.localized(using: table))
                        }
                    }
                    Toggle(isOn: $notificationCenter) {
                        Text("GNAME_NOTIFICATION_CENTER".localized(using: table))
                        Text("GNAME_NOTIFICATION_CENTER_LABEL".localized(using: table))
                    }
                    Picker("GNAME_MISSIONCONTROL".localized(using: table), selection: $missionControl){
                        ForEach(missionControlOptions, id: \.self) { option in
                            Text(option.localized(using: table))
                        }
                    }
                    Picker("GNAME_APPEXPOSE".localized(using: table), selection: $appExpose){
                        ForEach(exposeOptions, id: \.self) { option in
                            Text(option.localized(using: table))
                        }
                    }
                    Toggle(isOn: $showDesktop) {
                        Text("GNAME_SHOWDESKTOP".localized(using: table))
                        Text("GNAME_SHOWDESKTOP_LABEL".localized(using: table))
                    }
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
