//
//  GeneralView.swift
//  System Settings
//

import SwiftUI

/// The view for `System Settings > General`
struct GeneralView: View {
    @State private var titleOpacity = 0.0
    @State private var coverageSignInAlert = false
    let localization = LocalizationManager(
        bundleURL: "/System/Applications/System Settings.app/Contents/PlugIns/GeneralSettings.appex"
    )
    let aboutTable = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/AboutExtension.appex",
        stringsFile: "InfoPlist"
    )
    let updateTable = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/SoftwareUpdateSettingsExtension.appex",
        stringsFile: "InfoPlist"
    )
    let storageTable = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/Storage.appex",
        stringsFile: "InfoPlist"
    )
    let coverageTable = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/CoverageSettings.appex"
    )
    let coverageTitleTable = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/CoverageSettings.appex",
        stringsFile: "InfoPlist"
    )
    let handoffTable = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/AirDropHandoffExtension.appex",
        stringsFile: "InfoPlist"
    )
    let autofillTable = LocalizationManager(
        bundleURL: "/System/Applications/Passwords.app"
    )
    let dateTable = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/DateAndTime Extension.appex",
        stringsFile: "InfoPlist"
    )
    let localeTable = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/Localization.appex",
        stringsFile: "InfoPlist"
    )
    let loginTable = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/LoginItems.appex",
        stringsFile: "InfoPlist"
    )
    let sharingTable = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/Sharing.appex",
        stringsFile: "InfoPlist"
    )
    let startupTable = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/StartupDisk.appex",
        stringsFile: "InfoPlist"
    )
    let timeTable = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/TimeMachineSettings.appex",
        stringsFile: "InfoPlist"
    )
    let mdmTable = LocalizationManager(
        bundleURL: "/System/Library/PrivateFrameworks/DeviceManagement.framework",
        stringsFile: "InfoPlist"
    )
    let transferTable = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/TransferResetExtension.appex",
        stringsFile: "InfoPlist"
    )
    
    var body: some View {
        CustomForm(title: "General") {
            // Placard
            Section {
                VStack(spacing: 5) {
                    IconView(icon: "com.apple.graphic-icon.gear", size: 64)
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
                NavigationLink(value: "About") {
                    SettingsCell(
                        "CFBundleDisplayName".localized(using: aboutTable),
                        symbol: "com.apple.graphic-icon.about-current-device"
                    )
                }
                NavigationLink(value: "Software Update") {
                    SettingsCell(
                        "CFBundleDisplayName".localized(using: updateTable),
                        symbol: "com.apple.graphic-icon.software-update"
                    )
                }
                NavigationLink(value: "Storage") {
                    SettingsCell(
                        "CFBundleDisplayName".localized(using: storageTable),
                        symbol: "com.apple.settings.PrivacySecurity.extension.privacy-blockDevice"
                    )
                }
            }
            
            Section {
                Button {
                    coverageSignInAlert.toggle()
                } label: {
                    SettingsCell(
                        "CFBundleDisplayName".localized(using: coverageTitleTable),
                        symbol: "com.apple.graphic-icon.applecare"
                    )
                    Image(systemName: "chevron.right")
                        .imageScale(.small)
                        .fontWeight(.semibold)
                        .foregroundStyle(.tertiary)
                }
                .buttonStyle(.plain)
                .sheet(isPresented: $coverageSignInAlert) {
                    VStack(spacing: 20) {
                        IconView(icon: "com.apple.graphic-icon.applecare", size: 64)
                        Text("APPLEID_SIGN_IN_TITLE".localized(using: coverageTable))
                            .bold()
                        Text("APPLEID_SIGN_IN_SUBTITLE".localized(using: coverageTable))
                            .font(.caption)
                        HStack {
                            Button {
                                coverageSignInAlert.toggle()
                            } label: {
                                Text("Cancel")
                                    .frame(maxWidth: .infinity)
                            }
                            
                            Button {
                                coverageSignInAlert.toggle()
                            } label: {
                                Text("Sign in…")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 250)
                }
            }
            
            Section {
                NavigationLink(value: "AirDrop & Handoff") {
                    SettingsCell(
                        "CFBundleDisplayName".localized(using: handoffTable),
                        symbol: "com.apple.graphic-icon.airdrop"
                    )
                }
            }
            
            Section {
                NavigationLink(value: "AutoFill & Passwords") {
                    SettingsCell(
                        "AutoFill & Passwords".localized(using: autofillTable),
                        symbol: "com.apple.Passwords-Settings.AutoFill"
                    )
                }
                NavigationLink(value: "Date & Time") {
                    SettingsCell(
                        "CFBundleDisplayName".localized(using: dateTable),
                        symbol: "com.apple.graphic-icon.date-and-time"
                    )
                }
                NavigationLink(value: "Language & Region") {
                    SettingsCell(
                        "CFBundleDisplayName".localized(using: localeTable),
                        symbol: "com.apple.graphic-icon.language"
                    )
                }
                NavigationLink(value: "Login Items & Extensions") {
                    SettingsCell(
                        "CFBundleDisplayName".localized(using: loginTable),
                        symbol: "/System/Library/ExtensionKit/Extensions/LoginItems.appex"
                    )
                }
                NavigationLink(value: "Sharing") {
                    SettingsCell(
                        "CFBundleDisplayName".localized(using: sharingTable),
                        symbol: "/System/Library/ExtensionKit/Extensions/Sharing.appex"
                    )
                }
                NavigationLink(value: "Startup Disk") {
                    SettingsCell(
                        "CFBundleDisplayName".localized(using: startupTable),
                        symbol: "com.apple.graphic-icon.internal-drive"
                    )
                }
                NavigationLink(value: "Time Machine") {
                    SettingsCell(
                        "CFBundleDisplayName".localized(using: timeTable),
                        symbol: "com.apple.backup.launcher"
                    )
                }
            }
            
            Section {
                NavigationLink(value: "Device Management") {
                    SettingsCell(
                        "CFBundleDisplayName".localized(using: mdmTable),
                        symbol: "com.apple.NetworkExtensionSettingsUI.icon.profile"
                    )
                }
            }
            
            Section {
                NavigationLink(value: "Transfer or Reset") {
                    SettingsCell(
                        "CFBundleDisplayName".localized(using: transferTable),
                        symbol: "com.apple.graphic-icon.transfer-or-reset-iphone"
                    )
                }
            }
        }
        .navigationDestination(for: String.self) { value in
            switch value {
            case "About":
                AboutView()
            case "Software Update":
                SoftwareUpdateView()
            case "Storage":
                StorageView()
            default:
                CustomForm(title: value, root: false) {
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .frame(height: 600)
}
