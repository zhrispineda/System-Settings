//
//  SettingsModel.swift
//  System Settings
//

import SwiftUI

enum SettingsOptions: String {
    case signIn = "Sign in"
    
    case wifi = "Wi-Fi"
    case bluetooth = "Bluetooth"
    case network = "Network"
    case battery = "Battery"
    
    case general = "General"
    case accessibility = "Accessibility"
    case appearance = "Appearance"
    case menuBar = "Menu Bar"
    case siri = "Apple Intelligence & Siri"
    case desktopDock = "Desktop & Dock"
    case displays = "Displays"
    case spotlight = "Spotlight"
    case wallpaper = "Wallpaper"
    
    case notifications = "Notifications"
    case sound = "Sound"
    case focus = "Focus"
    case screenTime = "Screen Time"
    
    case lockScreen = "Lock Screen"
    case privacySecurity = "Privacy & Security"
    case touchIDPassword = "Touch ID & Password"
    case usersGroups = "Users & Groups"
    
    case internetAccounts = "Internet Accounts"
    case gameCenter = "Game Center"
    case icloud = "iCloud"
    case walletApplePay = "Wallet & Apple Pay"
    
    case keyboard = "Keyboard"
    case trackpad = "Trackpad"
    case printersScanners = "Printers & Scanners"
}

struct SettingsItem: Identifiable, Hashable {
    var id: String { title }
    let type: SettingsOptions
    var title: String { type.rawValue }
    let icon: String
    let destination: AnyView
    
    static func == (lhs: SettingsItem, rhs: SettingsItem) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

@MainActor
let accountOptions: [SettingsItem] = [
    SettingsItem(type: .signIn, icon: "", destination: AnyView(SignInView()))
]

@MainActor
let radioOptions: [SettingsItem] = [
    SettingsItem(type: .wifi, icon: "com.apple.graphic-icon.wifi", destination: AnyView(WiFiView())),
    SettingsItem(type: .bluetooth, icon: "com.apple.graphic-icon.bluetooth", destination: AnyView(BluetoothView())),
    SettingsItem(type: .network, icon: "com.apple.graphic-icon.local-network", destination: AnyView(NetworkView())),
    SettingsItem(type: .battery, icon: "com.apple.graphic-icon.battery", destination: AnyView(BatteryView()))
]

@MainActor
let mainOptions: [SettingsItem] = [
    SettingsItem(type: .general, icon: "com.apple.graphic-icon.gear", destination: AnyView(GeneralView())),
    SettingsItem(type: .accessibility, icon: "com.apple.graphic-icon.accessibility", destination: AnyView(AccessibilityView())),
    SettingsItem(type: .appearance, icon: "com.apple.graphic-icon.dark-mode", destination: AnyView(AppearanceView())),
    SettingsItem(type: .menuBar, icon: "com.apple.controlcenter.settings", destination: AnyView(MenuBarView())),
    SettingsItem(type: .siri, icon: "com.apple.application-icon.apple-intelligence", destination: AnyView(SiriView())),
    SettingsItem(type: .desktopDock, icon: "com.apple.graphic-icon.desktop", destination: AnyView(DesktopDockView())),
    SettingsItem(type: .displays, icon: "com.apple.graphic-icon.display", destination: AnyView(DisplaysView())),
    SettingsItem(type: .spotlight, icon: "com.apple.graphic-icon.search", destination: AnyView(SpotlightView())),
    SettingsItem(type: .wallpaper, icon: "com.apple.graphic-icon.wallpaper", destination: AnyView(WallpaperView()))
]

@MainActor
let focusOptions: [SettingsItem] = [
    SettingsItem(type: .notifications, icon: "com.apple.graphic-icon.notifications", destination: AnyView(NotificationsView())),
    SettingsItem(type: .sound, icon: "com.apple.graphic-icon.sound", destination: AnyView(SoundView())),
    SettingsItem(type: .focus, icon: "com.apple.graphic-icon.focus", destination: AnyView(FocusView())),
    SettingsItem(type: .screenTime, icon: "com.apple.graphic-icon.screen-time", destination: AnyView(ScreenTimeView()))
]

@MainActor
let authOptions: [SettingsItem] = [
    SettingsItem(type: .lockScreen, icon: "com.apple.controlcenter.lockscreen", destination: AnyView(LockScreenView())),
    SettingsItem(type: .privacySecurity, icon: "com.apple.graphic-icon.privacy", destination: AnyView(PrivacySecurityView())),
    SettingsItem(type: .touchIDPassword, icon: "com.apple.graphic-icon.touch-id", destination: AnyView(PasswordView())),
    SettingsItem(type: .usersGroups, icon: "com.apple.graphic-icon.group", destination: AnyView(UsersGroupsView()))
]

@MainActor
let serviceOptions: [SettingsItem] = [
    SettingsItem(type: .internetAccounts, icon: "com.apple.accounts.generic-account", destination: AnyView(InternetAccountsView())),
    SettingsItem(type: .gameCenter, icon: "com.apple.gamecenter.bubbles", destination: AnyView(GameCenterView())),
    SettingsItem(type: .icloud, icon: "com.apple.application-icon.icq.icloud", destination: AnyView(SignInView())),
    SettingsItem(type: .walletApplePay, icon: "/System/Library/ExtensionKit/Extensions/WalletSettingsExtension.appex", destination: AnyView(WalletView()))
]

@MainActor
let inputOptions: [SettingsItem] = [
    SettingsItem(type: .keyboard, icon: "com.apple.graphic-icon.keyboard", destination: AnyView(KeyboardView())),
    SettingsItem(type: .trackpad, icon: "com.apple.graphic-icon.trackpad-and-mouse", destination: AnyView(TrackpadView())),
    SettingsItem(type: .printersScanners, icon: "com.apple.graphic-icon.printer-sharing", destination: AnyView(PrintersScannersView()))
]
