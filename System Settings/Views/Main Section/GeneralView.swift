//
//  GeneralView.swift
//  System Settings
//
//  System Settings > General
//

import SwiftUI

struct GeneralView: View {
    @State private var titleOpacity = 0.0
    @State private var localization = LocalizationManager(bundleURL: "/System/Applications/System Settings.app/Contents/PlugIns/GeneralSettings.appex")
    
    var body: some View {
        CustomForm(title: "General") {
            // Placard
            Section {
                VStack(spacing: 5) {
                    TestIconView(icon: "com.apple.graphic-icon.gear", size: 64)
                        .padding(.top, 8)
                        .padding(.bottom, -1)
                        .overlay {
                            DividerGeometryView(dividerOpacity: $titleOpacity)
                        }
                    Text("General".localized(using: localization))
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, -5)
                    Text("Manage your overall setup and preferences for Mac, such as software updates, device language, AirDrop, and more.".localized(using: localization))
                        .lineSpacing(2.5)
                        .foregroundStyle(.secondary)
                        .font(.callout)
                        .padding(.bottom, 10)
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .navigationTitle(titleOpacity > 37.0 ? "General".localized(using: localization) : "")
            }

            Section {
                NavigationLink {
                    AboutView()
                } label: {
                    SettingsCell("About", symbol: "com.apple.graphic-icon.about-current-device")
                }
                NavigationLink(value: "Software Update") {
                    SettingsCell("Software Update", symbol: "com.apple.graphic-icon.software-update")
                }
                NavigationLink(value: "Storage") {
                    SettingsCell("Storage", symbol: "com.apple.settings.PrivacySecurity.extension.privacy-blockDevice")
                }
            }
            
            Section {
                NavigationLink(value: "AppleCare & Warranty") {
                    SettingsCell("AppleCare & Warranty", symbol: "com.apple.graphic-icon.applecare")
                }
            }

            Section {
                NavigationLink(value: "AirDrop & Handoff") {
                    SettingsCell("AirDrop & Handoff", symbol: "com.apple.graphic-icon.airdrop")
                }
            }
            
            Section {
                NavigationLink(value: "AutoFill & Passwords") {
                    SettingsCell("AutoFill & Passwords", symbol: "com.apple.Passwords-Settings.AutoFill")
                }
                NavigationLink(value: "Date & Time") {
                    SettingsCell("Date & Time", symbol: "com.apple.graphic-icon.date-and-time")
                }
                NavigationLink(value: "Language & Region") {
                    SettingsCell("Language & Region", color: .blue, symbol: "com.apple.graphic-icon.language")
                }
                NavigationLink(value: "Login Items & Extensions") {
                    SettingsCell("Login Items & Extensions", symbol: "/System/Library/ExtensionKit/Extensions/LoginItems.appex")
                }
                NavigationLink(value: "Sharing") {
                    SettingsCell("Sharing", symbol: "/System/Library/ExtensionKit/Extensions/Sharing.appex")
                }
                NavigationLink(value: "Startup Disk") {
                    SettingsCell("Startup Disk", symbol: "com.apple.graphic-icon.internal-drive")
                }
                NavigationLink(value: "Time Machine") {
                    SettingsCell("Time Machine", symbol: "com.apple.backup.launcher")
                }
            }
            
            Section {
                NavigationLink(value: "Device Management") {
                    SettingsCell("Device Management", symbol: "com.apple.NetworkExtensionSettingsUI.icon.profile")
                }
            }
            
            Section {
                NavigationLink(value: "Transfer or Reset") {
                    SettingsCell("Transfer or Reset", symbol: "com.apple.graphic-icon.transfer-or-reset-iphone")
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .frame(height: 600)
}
