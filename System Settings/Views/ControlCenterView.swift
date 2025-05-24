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
    @State private var accessibilityMenuBar = false
    @State private var accessibilityControlCenter = false
    @State private var batteryMenuBar = true
    @State private var batteryControlCenter = false
    @State private var batteryPercentage = false
    @State private var batteryEnergyMode = "When Active"
    @State private var musicMenuBar = false
    @State private var musicControlCenter = false
    @State private var hearingMenuBar = false
    @State private var hearingControlCenter = false
    @State private var userMenuBar = "Don‘t Show"
    @State private var userControlCenter = false
    @State private var keyboardMenuBar = false
    @State private var keyboardControlCenter = false
    let menuBarOptions = ["Show in Menu Bar", "Don‘t show in Menu Bar"]
    let menuBarActiveOptions = ["Show in Menu Bar", "Show When Active", "Don‘t show in Menu Bar"]
    let percentageOptions = ["When Active", "Always"]
    let userOptions = ["Don‘t Show", "Full Name", "Account Name", "Icon"]
    
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
                    Text("These modules are always visible in Control Center. You can choose when they should also show in the Menu Bar.")
                        .fontWeight(.regular)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            
            Section {
                // Accessibility Shortcuts
                HStack {
                    IconView("accessibility", color: .blue)
                    Text("Accessibility Shortcuts")
                }
                Toggle("Show in Menu Bar", isOn: $accessibilityMenuBar)
                    .padding(.leading, 28)
                Toggle("Show in Control Center", isOn: $accessibilityControlCenter)
                    .padding(.leading, 28)
            } header: {
                VStack(alignment: .leading) {
                    Text("Other Modules")
                        .font(.callout)
                        .bold()
                    Text("These modules can be added to Control Center and the Menu Bar.")
                        .fontWeight(.regular)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            
            // Battery
            Section {
                HStack {
                    IconView("battery.100percent", color: .green)
                    Text("Battery")
                }
                Group {
                    Toggle("Show in Menu Bar", isOn: $batteryMenuBar)
                    Toggle("Show in Control Center", isOn: $batteryControlCenter)
                    Toggle("Show Percentage", isOn: $batteryPercentage)
                    Picker("Show Energy Mode", selection: $batteryEnergyMode) {
                        ForEach(percentageOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
                .padding(.leading, 28)
            }
            
            // Music Recognition
            Section {
                HStack {
                    IconView("shazam.logo.fill", color: .blue)
                    Text("Music Recognition")
                }
                Toggle("Show in Menu Bar", isOn: $musicMenuBar)
                    .padding(.leading, 28)
                Toggle("Show in Control Center", isOn: $musicControlCenter)
                    .padding(.leading, 28)
            }
            
            // Hearing
            Section {
                HStack {
                    IconView("ear.fill", color: .gray)
                    Text("Hearing")
                }
                Toggle("Show in Menu Bar", isOn: $hearingMenuBar)
                    .padding(.leading, 28)
                Toggle("Show in Control Center", isOn: $hearingControlCenter)
                    .padding(.leading, 28)
            }
            
            // Fast User Switching
            Section {
                HStack {
                    IconView("person.crop.circle", color: .gray)
                    Text("Fast User Switching")
                }
                Picker("Show in Menu Bar", selection: $userMenuBar) {
                    ForEach(userOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                .padding(.leading, 28)
                Toggle("Show in Control Center", isOn: $userControlCenter)
                    .padding(.leading, 28)
            }
            
            // Keyboard Brightness
            Section {
                HStack {
                    IconView("light.max", color: .gray)
                    Text("Fast User Switching")
                }
                Toggle("Show in Menu Bar", isOn: $keyboardMenuBar)
                    .padding(.leading, 28)
                Toggle("Show in Control Center", isOn: $keyboardControlCenter)
                    .padding(.leading, 28)
            }
            
            Section("Menu Bar Only") {
                
            }
        }
    }
}

#Preview {
    ControlCenterView()
        .frame(height: 700)
}
