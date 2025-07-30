//
//  ScreenTimeView.swift
//  System Settings
//
//  System Settings > Screen Time
//

import SwiftUI

struct ScreenTimeView: View {
    @State private var table = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/ScreenTimePreferencesExtension.appex")
    
    var body: some View {
        CustomForm(title: "Screen Time".localized(using: table)) {
            Section {
                Placard(icon: "com.apple.graphic-icon.screen-time") {
                    Text("Screen Time".localized(using: table))
                    Text("""
                        Adults can set parental controls for a child's device, including app limits, content and web access, and approval requests.

                        You can also get insights about your personal screen time and set limits as needed.
                        """.localized(using: table))
                }
            }
            
            Section("Limit Usage".localized(using: table)) {
                NavigationLink {} label: {
                    SettingsCell("App & Website Activity".localized(using: table), symbol: "com.apple.prefpane.screentime.appUsage")
                }
            }
            
            Section("Communication".localized(using: table)) {
                NavigationLink {} label: {
                    SettingsCell("Communication Safety".localized(using: table), symbol: "com.apple.prefpane.screentime.communicationSafety")
                }
            }
            
            Section("Restrictions".localized(using: table)) {
                NavigationLink {} label: {
                    SettingsCell("Content & Privacy".localized(using: table), symbol: "com.apple.prefpane.screentime.contentPrivacy")
                }
            }
            
            Section {
                Toggle(isOn: .constant(false)) {
                    Text("Lock Screen Time Settings".localized(using: table))
                    Text("Use a passcode to secure Screen Time settings.".localized(using: table))
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
