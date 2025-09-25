//
//  MenuBarView.swift
//  System Settings
//
//  System Settings > Menu Bar
//

import SwiftUI

struct MenuBarView: View {
    @State private var table = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/ControlCenterSettings.appex")
    @State private var autoMenuBar = "In Full Screen Only"
    @State private var menuBarBackground = false
    @State private var recentCount = "10"
    @State private var siri = false
    @State private var spotlight = true
    @State private var wifi = true
    @State private var bluetooth = false
    @State private var battery = true
    @State private var focus = true
    @State private var focusShown = "Show When Active"
    @State private var screenMirroring = true
    @State private var mirrorShown = "Show When Active"
    @State private var display = true
    @State private var displayShown = "Show When Active"
    @State private var sound = true
    @State private var soundShown = "Show When Active"
    @State private var nowPlaying = true
    @State private var playingShown = "Show When Active"
    @State private var timeMachine = false
    @State private var weather = false
    let autoMenuBarOptions = ["Always", "On Desktop Only", "In Full Screen Only", "Never"]
    let recentOptions = ["None", "5", "10", "15", "20", "30", "50"]
    let showOptions = ["Always Show", "Show When Active"]
    
    var body: some View {
        CustomForm(title: "MENUBAR_SIDEBAR_TITLE".localized(using: table)) {
            Section {
                Picker("Automatically hide and show the menu bar".localized(using: table), selection: $autoMenuBar) {
                    ForEach(autoMenuBarOptions, id: \.self) { option in
                        Text(option.localized(using: table))
                    }
                }
                Toggle("Show menu bar background", isOn: $menuBarBackground)
                Picker("Recent documents, applications, and servers".localized(using: table), selection: $recentCount) {
                    ForEach(recentOptions, id: \.self) { option in
                        Text(option.localized(using: table))
                    }
                }
            }
            
            Section {
                HStack {
                    VStack(alignment: .leading) {
                        Text("System and app controls can be configured to appear in both Control Center and the menu bar.".localized(using: table))
                            .foregroundStyle(.secondary)
                            .font(.system(size: 11))
                        Button("Add Controls…") {}
                    }
                    .padding(-2)
                    if let asset = NSImage.asset(path: "/System/Library/ExtensionKit/Extensions/ControlCenterSettings.appex", name: "education-asset") {
                        Image(nsImage: asset)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.vertical, -10)
                            .padding(.trailing, -10)
                    }
                }
            } header: {
                Text("Menu Bar Controls".localized(using: table))
            }
            
            Section {
                HStack(spacing: 4) {
                    IconView(icon: "com.apple.controlcenter.clock", size: 24)
                    Text("Clock".localized(using: table))
                    Spacer()
                    Button("Clock Options…".localized(using: table)) {}
                }
                .padding(.leading, 20)
                Group {
                    Toggle(isOn: $siri) {
                        HStack(spacing: 4) {
                            IconView(icon: "com.apple.siri", size: 24)
                            Text("Siri".localized(using: table))
                        }
                    }
                    Toggle(isOn: $spotlight) {
                        HStack(spacing: 4) {
                            IconView(icon: "com.apple.spotlight", size: 24)
                            Text("Spotlight".localized(using: table))
                        }
                    }
                    Toggle(isOn: $wifi) {
                        HStack(spacing: 4) {
                            IconView(icon: "com.apple.graphic-icon.wifi", size: 24)
                            Text("Wi-Fi".localized(using: table))
                        }
                    }
                    Toggle(isOn: $bluetooth) {
                        HStack(spacing: 4) {
                            IconView(icon: "com.apple.graphic-icon.bluetooth", size: 24)
                            Text("Bluetooth".localized(using: table))
                        }
                    }
                    Toggle(isOn: $battery) {
                        HStack(spacing: 4) {
                            IconView(icon: "com.apple.graphic-icon.battery", size: 24)
                            Text("Battery".localized(using: table))
                            Spacer()
                            Button("Battery Options…") {}
                        }
                    }
                    Toggle(isOn: $focus) {
                        HStack(spacing: 4) {
                            IconView(icon: "com.apple.graphic-icon.focus", size: 24)
                            Text("Focus".localized(using: table))
                            Spacer()
                            Picker("Focus".localized(using: table), selection: $focusShown) {
                                ForEach(showOptions, id: \.self) { option in
                                    Text(option.localized(using: table))
                                }
                            }
                            .labelsHidden()
                        }
                    }
                    Toggle(isOn: $screenMirroring) {
                        HStack(spacing: 4) {
                            IconView(icon: "com.apple.controlcenter.screenmirroring", size: 24)
                            Text("Screen Mirroring".localized(using: table))
                            Spacer()
                            Picker("Screen Mirroring".localized(using: table), selection: $mirrorShown) {
                                ForEach(showOptions, id: \.self) { option in
                                    Text(option.localized(using: table))
                                }
                            }
                            .labelsHidden()
                        }
                    }
                    Toggle(isOn: $display) {
                        HStack(spacing: 4) {
                            IconView(icon: "com.apple.graphic-icon.display", size: 24)
                            Text("Display".localized(using: table))
                            Spacer()
                            Picker("Display".localized(using: table), selection: $displayShown) {
                                ForEach(showOptions, id: \.self) { option in
                                    Text(option.localized(using: table))
                                }
                            }
                            .labelsHidden()
                        }
                    }
                    Toggle(isOn: $sound) {
                        HStack(spacing: 4) {
                            IconView(icon: "com.apple.graphic-icon.sound", size: 24)
                            Text("Sound".localized(using: table))
                            Spacer()
                            Picker("Sound".localized(using: table), selection: $soundShown) {
                                ForEach(showOptions, id: \.self) { option in
                                    Text(option.localized(using: table))
                                }
                            }
                            .labelsHidden()
                        }
                    }
                    Toggle(isOn: $nowPlaying) {
                        HStack(spacing: 4) {
                            IconView(icon: "com.apple.controlcenter.nowplaying", size: 24)
                            Text("Now Playing".localized(using: table))
                            Spacer()
                            Picker("Now Playing".localized(using: table), selection: $playingShown) {
                                ForEach(showOptions, id: \.self) { option in
                                    Text(option.localized(using: table))
                                }
                            }
                            .labelsHidden()
                        }
                    }
                    Toggle(isOn: $timeMachine) {
                        HStack(spacing: 4) {
                            IconView(icon: "com.apple.backup.launcher", size: 24)
                            Text("Time Machine".localized(using: table))
                        }
                    }
                    Toggle(isOn: $weather) {
                        HStack(spacing: 4) {
                            IconView(icon: "com.apple.weather", size: 24)
                            Text("Weather".localized(using: table))
                        }
                    }
                }
                .toggleStyle(.checkbox)
            }
            
            Section {} footer: {
                HStack {
                    Button("Reset Menu Bar and Control Center…".localized(using: table)) {}
                    HelpButton(topicID: "mchlad96d366")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    MenuBarView()
        .frame(height: 700)
}

