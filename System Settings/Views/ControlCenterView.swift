//
//  ControlCenterView.swift
//  System Settings
//
//  System Settings > Control Center
//

import SwiftUI

struct ControlCenterView: View {
    @State private var wifiSelection = "Show in Menu Bar"
    @State private var bluetoothSelection = "Don‘t show in Menu Bar"
    @State private var airDropSelection = "Don‘t show in Menu Bar"
    @State private var focusSelection = "Show When Active"
    @State private var stageManageSelection = "Don‘t show in Menu Bar"
    @State private var screenMirroringSelection = "Show When Active"
    @State private var displaySelection = "Show When Active"
    @State private var soundSelection = "Show When Active"
    @State private var nowPlayingSelection = "Show When Active"
    let menuBarOptions = ["Show in Menu Bar", "Don‘t show in Menu Bar"]
    let menuBarActiveOptions = ["Show in Menu Bar", "Show When Active", "Don‘t show in Menu Bar"]
    
    var body: some View {
        CustomForm(title: "Control Center") {
            Section {
                // Wi-Fi
                HStack {
                    IconView("wifi", color: .blue)
                    Picker("Wi-Fi", selection: $wifiSelection) {
                        ForEach(menuBarOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
                // Bluetooth
                HStack {
                    IconView("bluetooth", color: .blue)
                    Picker("Bluetooth", selection: $bluetoothSelection) {
                        ForEach(menuBarOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
                // AirDrop
                HStack {
                    IconView("airdrop", color: .white)
                    Picker("AirDrop", selection: $airDropSelection) {
                        ForEach(menuBarOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
                // Focus
                HStack {
                    IconView("moon.fill", color: .indigo)
                    Picker("Focus", selection: $focusSelection) {
                        ForEach(menuBarActiveOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
                // Stage Manager
                HStack {
                    IconView("squares.leading.rectangle", color: .black)
                    Picker("Stage Manager", selection: $stageManageSelection) {
                        ForEach(menuBarOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
                // Screen Mirroring
                HStack {
                    IconView("inset.filled.rectangle.on.rectangle", color: .cyan)
                    Picker("Screen Mirroring", selection: $screenMirroringSelection) {
                        ForEach(menuBarActiveOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
                // Display
                HStack {
                    IconView("sun.max.fill", color: .blue)
                    Picker("Display", selection: $displaySelection) {
                        ForEach(menuBarActiveOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
                // Sound
                HStack {
                    IconView("speaker.3.fill", color: .pink)
                    Picker("Sound", selection: $soundSelection) {
                        ForEach(menuBarActiveOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
                // Now Playing
                HStack {
                    IconView("play.fill", color: .orange)
                    Picker("Now Playing", selection: $nowPlayingSelection) {
                        ForEach(menuBarActiveOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
            } header: {
                VStack(alignment: .leading) {
                    Text("Control Center Modules")
                        .font(.callout)
                        .bold()
                    Text("These modules are always visible in Control Center. You can choose when they should also show in the Menu Bar")
                        .fontWeight(.regular)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    ControlCenterView()
        .frame(height: 500)
}
