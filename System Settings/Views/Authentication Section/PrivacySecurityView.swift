//
//  PrivacySecurityView.swift
//  System Settings
//
//  System Settings > Privacy & Security
//

import SwiftUI

struct PrivacySecurityView: View {
    @State private var table = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/SecurityPrivacyExtension.appex")
    @State private var allowApplications = "App Store & Known Developers"
    let appOptions = ["App Store", "App Store & Known Developers"]
    
    var body: some View {
        CustomForm(title: "Privacy & Security") {
            Section {
                Placard(icon: "com.apple.graphic-icon.privacy") {
                    Text("Privacy".localized(using: table))
                    Text(.init("Control which apps can access your data, location, camera, and microphone, and manage safety protections. [Learn more…](help:anchor=mchl0b8771e8%20bookID=com.apple.machelp)".localized(using: table)))
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("LOCATION_SERVICES".localized(using: table), symbol: "com.apple.graphic-icon.location")
                    Text("Off".localized(using: table)).foregroundStyle(.secondary)
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("CALENDARS".localized(using: table), subtitle: "None", symbol: "com.apple.iCal")
                }
                NavigationLink {} label: {
                    SettingsCell("CONTACTS".localized(using: table), subtitle: "None", symbol: "com.apple.AddressBook")
                }
                NavigationLink {} label: {
                    SettingsCell("FILE_ACCESS_COMBINED".localized(using: table), subtitle: "None", symbol: "com.apple.settings.PrivacySecurity.extension.privacy-filesandfolders")
                }
                NavigationLink {} label: {
                    SettingsCell("ALL_FILES".localized(using: table), subtitle: "None", symbol: "com.apple.settings.PrivacySecurity.extension.privacy-allfiles")
                }
                NavigationLink {} label: {
                    SettingsCell("HomeKit".localized(using: table), subtitle: "None", symbol: "com.apple.Home")
                }
                NavigationLink {} label: {
                    SettingsCell("MEDIA".localized(using: table), subtitle: "None", symbol: "com.apple.Music")
                }
                NavigationLink {} label: {
                    SettingsCell("WEB_BROWSER_PASSKEY_ACCESS".localized(using: table), subtitle: "None", symbol: "com.apple.graphic-icon.person-passkey")
                }
                NavigationLink {} label: {
                    SettingsCell("Photos".localized(using: table), subtitle: "None", symbol: "com.apple.Photos")
                }
                NavigationLink {} label: {
                    SettingsCell("REMINDERS".localized(using: table), subtitle: "None", symbol: "com.apple.Reminders")
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("ACCESSIBILITY".localized(using: table), symbol: "com.apple.graphic-icon.accessibility")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("APPLICATION_BUNDLES".localized(using: table), symbol: "com.apple.AppStore")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("AUTOMATION".localized(using: table), symbol: "com.apple.graphic-icon.automation")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("BLUETOOTH".localized(using: table), symbol: "com.apple.graphic-icon.bluetooth")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("CAMERA".localized(using: table), symbol: "com.apple.graphic-icon.video-camera")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("DEV_TOOLS".localized(using: table), symbol: "com.apple.graphic-icon.developer-tools")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("DND".localized(using: table), symbol: "com.apple.graphic-icon.focus")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("LISTEN_EVENT".localized(using: table), symbol: "com.apple.graphic-icon.input-monitoring")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("LOCAL_NETWORK".localized(using: table), symbol: "com.apple.graphic-icon.local-network")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("MICROPHONE".localized(using: table), symbol: "com.apple.graphic-icon.microphone")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("MOTION".localized(using: table), symbol: "com.apple.graphic-icon.motion-and-fitness")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("REMOTE_DESKTOP".localized(using: table), symbol: "com.apple.graphic-icon.remote-desktop")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("SCREENANDAUDIOCAPTURE".localized(using: table), symbol: "com.apple.graphic-icon.screen-recording")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("SPEECH_RECOGNITION".localized(using: table), symbol: "com.apple.graphic-icon.waveform")
                    Text("0").foregroundStyle(.secondary)
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("Sensitive Content Warning".localized(using: table), symbol: "com.apple.graphic-icon.sensitive-media-check")
                    Text("Off".localized(using: table)).foregroundStyle(.secondary)
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("BLOCKED_CONTACTS".localized(using: table), symbol: "com.apple.graphic-icon.content-and-privacy-restrictions")
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("ANALYTICS".localized(using: table), symbol: "com.apple.graphic-icon.analytics-and-improvements")
                }
                NavigationLink {} label: {
                    SettingsCell("ADVERTISING".localized(using: table), symbol: "com.apple.graphic-icon.apple-advertising")
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("APPLE_INTELLIGENCE_REPORT".localized(using: table), symbol: "com.apple.graphic-icon.intelligence")
                    Text("On".localized(using: table)).foregroundStyle(.secondary)
                }
            }
            
            Section("Security".localized(using: table)) {
                Picker("Allow applications from".localized(using: table), selection: $allowApplications) {
                    ForEach(appOptions, id: \.self) { option in
                        Text(option.localized(using: table))
                    }
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("FileVault".localized(using: table), symbol: "com.apple.settings.PrivacySecurity.extension.FileVault")
                    Text("Off".localized(using: table)).foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    HStack {
                        SettingsCell("Accessories".localized(using: table), symbol: "com.apple.graphic-icon.usb-c-port")
                        Spacer()
                        Text("Ask for New Accessories".localized(using: table)).foregroundStyle(.secondary)
                    }
                }
                NavigationLink {} label: {
                    SettingsCell("Lockdown Mode".localized(using: table), symbol: "com.apple.graphic-icon.privacy")
                }
            }
            
            Section {} footer: {
                HStack {
                    Button("Advanced…".localized(using: table)) {}
                    HelpButton(topicID: "mchl211c911f")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    NavigationStack {
        PrivacySecurityView()
    }
    .frame(height: 900)
}
