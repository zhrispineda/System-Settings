//
//  ScreenTimeView.swift
//  System Settings
//
//  System Settings > Screen Time
//

import SwiftUI

struct ScreenTimeView: View {
    var body: some View {
        CustomForm(title: "Screen Time") {
            Section {
                Placard(icon: "com.apple.graphic-icon.screen-time") {
                    Text("Screen Time")
                    Text("""
                        Adults can set parental controls for a child's device, including app limits, content and web access, and approval requests.
                         
                        You can also get insights about your personal screen time and set limits as needed.
                        """)
                }
            }
            
            Section("Limit Usage") {
                NavigationLink {} label: {
                    SettingsCell("App & Website Activity", symbol: "com.apple.prefpane.screentime.appUsage")
                }
                NavigationLink {} label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 6.0)
                            .foregroundStyle(.white.gradient)
                            .scaledToFit()
                            .frame(width: 20)
                        if let img = NSImage.asset(path: "/System/Library/ExtensionKit/Extensions/ScreenTimePreferencesExtension.appex", name: "screen-distance") {
                            Image(nsImage: img)
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.blue)
                                .frame(width: 20)
                        }
                    }
                    Text("Screen Distance")
                        .padding(.leading, 2)
                }
            }
            
            Section("Communications") {
                NavigationLink {} label: {
                    SettingsCell("Communication Limits", symbol: "com.apple.prefpane.screentime.communicationLimits")
                }
                NavigationLink {} label: {
                    SettingsCell("Communication Safety", symbol: "com.apple.prefpane.screentime.communicationSafety")
                }
            }
            
            Section("Restrictions") {
                NavigationLink {} label: {
                    SettingsCell("Content & Privacy", symbol: "com.apple.prefpane.screentime.contentPrivacy")
                }
            }
            
            Section {
                Toggle(isOn: .constant(false)) {
                    Text("Share across devices")
                    Text("You can enable this on any device signed in to iCloud to sync your Screen Time settings.")
                }
                .disabled(true)
            }
            
            Section {
                Toggle(isOn: .constant(false)) {
                    Text("Lock Screen Time Settings")
                    Text("Use a passcode to secure Screen Time settings.")
                }
                .disabled(true)
            }
            
            Section {} footer: {
                HelpButton(topicID: "mchlca5139d2")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ScreenTimeView()
    }
}
