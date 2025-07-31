//
//  PrivacySecurityView.swift
//  System Settings
//
//  System Settings > Privacy & Security
//

import SwiftUI

struct PrivacySecurityView: View {
    @State private var allowApplications = "App Store & Known Developers"
    let appOptions = ["App Store", "App Store & Known Developers"]
    
    var body: some View {
        CustomForm(title: "Privacy & Security") {
            Section {
                Placard(icon: "com.apple.graphic-icon.privacy") {
                    Text("Privacy")
                    Text("Control which apps can access your data, location, camera, and microphone, and manage safety protections. [Learn more…](help:anchor=mchl0b8771e8%20bookID=com.apple.machelp)")
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("Location Services", symbol: "com.apple.graphic-icon.location")
                    Text("Off").foregroundStyle(.secondary)
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("Calendars", subtitle: "None", symbol: "com.apple.iCal")
                }
                NavigationLink {} label: {
                    SettingsCell("Contacts", subtitle: "None", symbol: "com.apple.AddressBook")
                }
                NavigationLink {} label: {
                    SettingsCell("Files & Folders", subtitle: "None", symbol: "com.apple.settings.PrivacySecurity.extension.privacy-filesandfolders")
                }
                NavigationLink {} label: {
                    SettingsCell("Full Disk Access", subtitle: "None", symbol: "com.apple.settings.PrivacySecurity.extension.privacy-allfiles")
                }
                NavigationLink {} label: {
                    SettingsCell("Home Accessories", subtitle: "None", symbol: "com.apple.Home")
                }
                NavigationLink {} label: {
                    SettingsCell("Media & Apple Music", subtitle: "None", symbol: "com.apple.Music")
                }
                NavigationLink {} label: {
                    SettingsCell("Passkeys Access for Web Browsers", subtitle: "None", symbol: "com.apple.graphic-icon.person-passkey")
                }
                NavigationLink {} label: {
                    SettingsCell("Photos", subtitle: "None", symbol: "com.apple.Photos")
                }
                NavigationLink {} label: {
                    SettingsCell("Reminders", subtitle: "None", symbol: "com.apple.Reminders")
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("Accessibility", symbol: "com.apple.graphic-icon.accessibility")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("App Management", symbol: "com.apple.AppStore")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("Automation", symbol: "com.apple.graphic-icon.automation")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("Bluetooth", symbol: "com.apple.graphic-icon.bluetooth")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("Camera", symbol: "com.apple.graphic-icon.video-camera")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("Developer Tools", symbol: "com.apple.graphic-icon.developer-tools")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("Focus", symbol: "com.apple.graphic-icon.focus")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("Input Monitoring", symbol: "com.apple.graphic-icon.input-monitoring")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("Local Network", symbol: "com.apple.graphic-icon.local-network")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("Local Network", symbol: "com.apple.graphic-icon.microphone")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("Motion & Fitness", symbol: "com.apple.graphic-icon.motion-and-fitness")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("Remote Desktop", symbol: "com.apple.graphic-icon.remote-desktop")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("Screen & System Audio Recording", symbol: "com.apple.graphic-icon.screen-recording")
                    Text("0").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    SettingsCell("Speech Recognition", symbol: "com.apple.graphic-icon.waveform")
                    Text("0").foregroundStyle(.secondary)
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("Sensitive Content Warning", symbol: "com.apple.graphic-icon.sensitive-media-check")
                    Text("Off").foregroundStyle(.secondary)
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("Blocked Contacts", symbol: "com.apple.graphic-icon.content-and-privacy-restrictions")
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("Analytics & Improvements", symbol: "com.apple.graphic-icon.analytics-and-improvements")
                }
                NavigationLink {} label: {
                    SettingsCell("Apple Advertising", symbol: "com.apple.graphic-icon.apple-advertising")
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("Apple Intelligence Report", symbol: "com.apple.graphic-icon.intelligence")
                    Text("On").foregroundStyle(.secondary)
                }
            }
            
            Section("Security") {
                Picker("Allow applications from", selection: $allowApplications) {
                    ForEach(appOptions, id: \.self) { option in
                        Text(option)
                    }
                }
            }
            
            Section {
                NavigationLink {} label: {
                    SettingsCell("FileVault", symbol: "com.apple.settings.PrivacySecurity.extension.FileVault")
                    Text("Off").foregroundStyle(.secondary)
                }
                NavigationLink {} label: {
                    HStack {
                        SettingsCell("Accessories", symbol: "com.apple.graphic-icon.usb-c-port")
                        Spacer()
                        Text("Ask for new accessories").foregroundStyle(.secondary)
                    }
                }
                NavigationLink {} label: {
                    SettingsCell("Lockdown Mode", symbol: "com.apple.graphic-icon.privacy")
                }
            }
            
            Section {} footer: {
                HStack {
                    Button("Advanced…") {}
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
