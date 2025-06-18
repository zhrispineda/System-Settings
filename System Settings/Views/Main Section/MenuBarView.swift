//
//  MenuBarView.swift
//  System Settings
//
//  System Settings > Menu Bar
//

import SwiftUI

struct MenuBarView: View {
    @State private var wifiSelection = "Show in Menu Bar"
    @State private var bluetoothSelection = "Don't Show in Menu Bar"
    @State private var airDropSelection = "Don't Show in Menu Bar"
    @State private var focusSelection = "Show When Active"
    @State private var stageManageSelection = "Don't Show in Menu Bar"
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
    @State private var userMenuBar = "Don't Show"
    @State private var userControlCenter = false
    @State private var keyboardMenuBar = false
    @State private var keyboardControlCenter = false
    @State private var spotlightMenuBar = "Show in Menu Bar"
    @State private var siriMenuBar = "Show in Menu Bar"
    @State private var timeMenuBar = "Don't Show in Menu Bar"
    @State private var weatherMenuBar = "Don't Show in Menu Bar"
    @State private var autoMenuBar = "In Full Screen Only"
    @State private var recentCount = "10"
    let autoMenuBarOptions = ["Always", "On Desktop Only", "In Full Screen Only", "Never"]
    let menuBarOptions = ["Show in Menu Bar", "Don't Show in Menu Bar"]
    let menuBarActiveOptions = ["Show in Menu Bar", "Show When Active", "Don't Show in Menu Bar"]
    let percentageOptions = ["When Active", "Always"]
    let recentOptions = ["None", "5", "10", "15", "20", "30", "50"]
    let userOptions = ["Don't Show", "Full Name", "Account Name", "Icon"]
    let table = "ControlCenterSettings"
    
    var body: some View {
        CustomForm(title: "Menu Bar") {
            Section {
                // Wi-Fi
                HStack {
                    IconView("wifi", color: .blue)
                    Picker("Wi-Fi".localize(table: table), selection: $wifiSelection) {
                        ForEach(menuBarOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                }
                // Bluetooth
                HStack {
                    IconView("bluetooth", color: .blue)
                    Picker("Bluetooth".localize(table: table), selection: $bluetoothSelection) {
                        ForEach(menuBarOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                }
                // AirDrop
                HStack {
                    IconView("airdrop", color: .white)
                    Picker("AirDrop".localize(table: table), selection: $airDropSelection) {
                        ForEach(menuBarOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                }
                // Focus
                HStack {
                    IconView("moon.fill", color: .indigo)
                    Picker("Focus".localize(table: table), selection: $focusSelection) {
                        ForEach(menuBarActiveOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                }
                // Stage Manager
                HStack {
                    IconView("squares.leading.rectangle", color: .black)
                    Picker("Stage Manager".localize(table: table), selection: $stageManageSelection) {
                        ForEach(menuBarOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                }
                // Screen Mirroring
                HStack {
                    IconView("inset.filled.rectangle.on.rectangle", color: .cyan)
                    Picker("Screen Mirroring".localize(table: table), selection: $screenMirroringSelection) {
                        ForEach(menuBarActiveOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                }
                // Display
                HStack {
                    IconView("sun.max.fill", color: .blue)
                    Picker("Display".localize(table: table), selection: $displaySelection) {
                        ForEach(menuBarActiveOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                }
                // Sound
                HStack {
                    IconView("speaker.3.fill", color: .pink)
                    Picker("Sound".localize(table: table), selection: $soundSelection) {
                        ForEach(menuBarActiveOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                }
                // Now Playing
                HStack {
                    IconView("play.fill", color: .orange)
                    Picker("Now Playing".localize(table: table), selection: $nowPlayingSelection) {
                        ForEach(menuBarActiveOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                }
            } header: {
                Text("Control Center Modules", tableName: table)
                Text("These modules are always visible in Control Center. You can choose when they should also show in the Menu Bar.", tableName: table)
            }
            
            Section {
                // Accessibility Shortcuts
                HStack {
                    IconView("accessibility", color: .blue)
                    Text("Accessibility Shortcuts", tableName: table)
                }
                Toggle("Show in Menu Bar".localize(table: table), isOn: $accessibilityMenuBar)
                    .padding(.leading, 28)
                Toggle("Show in Control Center".localize(table: table), isOn: $accessibilityControlCenter)
                    .padding(.leading, 28)
            } header: {
                Text("Other Modules", tableName: table)
                Text("These modules can be added to Control Center and the Menu Bar.", tableName: table)
            }
            
            // Battery
            Section {
                HStack {
                    IconView("battery.100percent", color: .green)
                    Text("Battery", tableName: table)
                }
                Group {
                    Toggle("Show in Menu Bar".localize(table: table), isOn: $batteryMenuBar)
                    Toggle("Show in Control Center".localize(table: table), isOn: $batteryControlCenter)
                    Toggle("Show Percentage".localize(table: table), isOn: $batteryPercentage)
                    Picker("Show Energy Mode".localize(table: table), selection: $batteryEnergyMode) {
                        ForEach(percentageOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                }
                .padding(.leading, 28)
            }
            
            // Music Recognition
            Section {
                HStack {
                    IconView("shazam.logo.fill", color: .blue)
                    Text("Music Recognition", tableName: table)
                }
                Toggle("Show in Menu Bar".localize(table: table), isOn: $musicMenuBar)
                    .padding(.leading, 28)
                Toggle("Show in Control Center".localize(table: table), isOn: $musicControlCenter)
                    .padding(.leading, 28)
            }
            
            // Hearing
            Section {
                HStack {
                    IconView("ear.fill", color: .gray)
                    Text("Hearing", tableName: table)
                }
                Toggle("Show in Menu Bar".localize(table: table), isOn: $hearingMenuBar)
                    .padding(.leading, 28)
                Toggle("Show in Control Center".localize(table: table), isOn: $hearingControlCenter)
                    .padding(.leading, 28)
            }
            
            // Fast User Switching
            Section {
                HStack {
                    IconView("person.crop.circle", color: .gray)
                    Text("Fast User Switching", tableName: table)
                }
                Picker("Show in Menu Bar".localize(table: table), selection: $userMenuBar) {
                    ForEach(userOptions, id: \.self) { option in
                        Text(option.localize(table: table))
                    }
                }
                .padding(.leading, 28)
                Toggle("Show in Control Center".localize(table: table), isOn: $userControlCenter)
                    .padding(.leading, 28)
            }
            
            // Keyboard Brightness
            Section {
                HStack {
                    IconView("light.max", color: .gray)
                    Text("Fast User Switching", tableName: table)
                }
                Toggle("Show in Menu Bar".localize(table: table), isOn: $keyboardMenuBar)
                    .padding(.leading, 28)
                Toggle("Show in Control Center".localize(table: table), isOn: $keyboardControlCenter)
                    .padding(.leading, 28)
            }
            
            Section("Menu Bar Only".localize(table: table)) {
                // Clock
                HStack {
                    IconView("clock.fill", color: .gray)
                    Text("Clock", tableName: table)
                    Spacer()
                    Button("Clock Options…".localize(table: table)) {}
                }
                // Spotlight
                HStack {
                    IconView("magnifyingglass", color: .gray)
                    Picker("Spotlight".localize(table: table), selection: $spotlightMenuBar) {
                        ForEach(menuBarOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                }
                // Siri
                HStack {
                    IconView("siri", color: .accentColor)
                    Picker("Siri".localize(table: table), selection: $siriMenuBar) {
                        ForEach(menuBarOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                }
                // Time Machine
                HStack {
                    IconView("TimeMachine", color: .clear)
                    Picker("Time Machine".localize(table: table), selection: $timeMenuBar) {
                        ForEach(menuBarOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                    .padding(.leading, -5)
                }
                // Weather
                HStack {
                    IconView("weather", color: .clear)
                    Picker("Weather".localize(table: table), selection: $weatherMenuBar) {
                        ForEach(menuBarOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                    .padding(.leading, -5)
                }
            }
            
            Section {
                Picker("Automatically hide and show the menu bar".localize(table: table), selection: $autoMenuBar) {
                    ForEach(autoMenuBarOptions, id: \.self) { option in
                        Text(option.localize(table: table))
                    }
                }
                Picker("Recent documents, applications, and servers".localize(table: table), selection: $recentCount) {
                    ForEach(recentOptions, id: \.self) { option in
                        Text(option.localize(table: table))
                    }
                }
            } footer: {
                HelpButton(topicID: "mchlad96d366")
            }
        }
    }
}

#Preview {
    MenuBarView()
        .frame(height: 700)
}

