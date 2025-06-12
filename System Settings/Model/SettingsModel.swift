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
    var color = Color.accentColor
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
    SettingsItem(type: .wifi, icon: "wifi", color: .blue, destination: AnyView(WiFiView())),
    SettingsItem(type: .bluetooth, icon: "bluetooth", color: .blue, destination: AnyView(BluetoothView())),
    SettingsItem(type: .network, icon: "network", color: .blue, destination: AnyView(NetworkView())),
    SettingsItem(type: .battery, icon: "battery.100", color: .green, destination: AnyView(BatteryView()))
]

@MainActor
let mainOptions: [SettingsItem] = [
    SettingsItem(type: .general, icon: "gear", color: .gray, destination: AnyView(GeneralView())),
    SettingsItem(type: .accessibility, icon: "accessibility", color: .blue, destination: AnyView(AccessibilityView())),
    SettingsItem(type: .appearance, icon: "appearance.lightmode", color: .black, destination: AnyView(AppearanceView())),
    SettingsItem(type: .menuBar, icon: "menubar.rectangle", color: .gray, destination: AnyView(MenuBarView())),
    SettingsItem(type: .siri, icon: "siri", destination: AnyView(SiriView())),
    SettingsItem(type: .desktopDock, icon: "menubar.dock.rectangle", color: .black, destination: AnyView(DesktopDockView())),
    SettingsItem(type: .displays, icon: "sun.max.fill", color: .blue, destination: AnyView(DisplaysView())),
    SettingsItem(type: .spotlight, icon: "magnifyingglass", color: .blue, destination: AnyView(SpotlightView())),
    SettingsItem(type: .wallpaper, icon: "apple.photos", color: .cyan, destination: AnyView(WallpaperView()))
]

@MainActor
let focusOptions: [SettingsItem] = [
    SettingsItem(type: .notifications, icon: "bell.badge.fill", color: .red, destination: AnyView(NotificationsView())),
    SettingsItem(type: .sound, icon: "speaker.3.fill", color: .pink, destination: AnyView(SoundView())),
    SettingsItem(type: .focus, icon: "moon.fill", color: .indigo, destination: AnyView(FocusView())),
    SettingsItem(type: .screenTime, icon: "hourglass", color: .indigo, destination: AnyView(ScreenTimeView()))
]

@MainActor
let authOptions: [SettingsItem] = [
    SettingsItem(type: .lockScreen, icon: "lock.dots.fill", color: .black, destination: AnyView(LockScreenView())),
    SettingsItem(type: .privacySecurity, icon: "hand.raised.fill", color: .blue, destination: AnyView(PrivacySecurityView())),
    SettingsItem(type: .touchIDPassword, icon: "touchid", color: .white, destination: AnyView(PasswordView())),
    SettingsItem(type: .usersGroups, icon: "person.2.fill", color: .blue, destination: AnyView(UsersGroupsView()))
]

@MainActor
let serviceOptions: [SettingsItem] = [
    SettingsItem(type: .internetAccounts, icon: "at", color: .blue, destination: AnyView(InternetAccountsView())),
    SettingsItem(type: .gameCenter, icon: "Game Center", destination: AnyView(GameCenterView())),
    SettingsItem(type: .icloud, icon: "iCloud", destination: AnyView(SignInView())),
    SettingsItem(type: .walletApplePay, icon: "Wallet", destination: AnyView(WalletView()))
]

@MainActor
let inputOptions: [SettingsItem] = [
    SettingsItem(type: .keyboard, icon: "keyboard.fill", color: .gray, destination: AnyView(KeyboardView())),
    SettingsItem(type: .trackpad, icon: "rectangle.and.hand.point.up.left.fill", color: .gray, destination: AnyView(TrackpadView())),
    SettingsItem(type: .printersScanners, icon: "printer.fill", color: .gray, destination: AnyView(PrintersScannersView()))
]
