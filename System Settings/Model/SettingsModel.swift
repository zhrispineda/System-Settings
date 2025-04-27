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
    case siri = "Apple Intelligence & Siri"
    case controlCenter = "Control Center"
    case desktopDock = "Desktop & Dock"
    case displays = "Displays"
    case screenSaver = "Screen Saver"
    case spotlight = "Spotlight"
    case wallpaper = "Wallpaper"
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

let accountOptions: [SettingsItem] = [
    SettingsItem(type: .signIn, icon: "", destination: AnyView(EmptyView()))
]

let radioOptions: [SettingsItem] = [
    SettingsItem(type: .wifi, icon: "wifi", color: .blue, destination: AnyView(EmptyView())),
    SettingsItem(type: .bluetooth, icon: "bluetooth", color: .blue, destination: AnyView(BluetoothView())),
    SettingsItem(type: .network, icon: "network", color: .blue, destination: AnyView(EmptyView())),
    SettingsItem(type: .battery, icon: "battery.100", color: .green, destination: AnyView(EmptyView()))
]

let mainOptions: [SettingsItem] = [
    SettingsItem(type: .general, icon: "gear", color: .gray, destination: AnyView(GeneralView())),
    SettingsItem(type: .accessibility, icon: "accessibility", color: .blue, destination: AnyView(EmptyView())),
    SettingsItem(type: .appearance, icon: "appearance.lightmode", color: .black, destination: AnyView(EmptyView())),
    SettingsItem(type: .siri, icon: "siri", destination: AnyView(EmptyView())),
    SettingsItem(type: .controlCenter, icon: "switch.2", color: .gray, destination: AnyView(EmptyView())),
    SettingsItem(type: .desktopDock, icon: "menubar.dock.rectangle", color: .black, destination: AnyView(EmptyView())),
    SettingsItem(type: .displays, icon: "sun.max.fill", color: .blue, destination: AnyView(EmptyView())),
    SettingsItem(type: .screenSaver, icon: "moon.and.stars.artframe", color: .cyan, destination: AnyView(EmptyView())),
    SettingsItem(type: .spotlight, icon: "magnifyingglass", color: .gray, destination: AnyView(EmptyView())),
    SettingsItem(type: .wallpaper, icon: "apple.photos", color: .cyan, destination: AnyView(EmptyView()))
]
