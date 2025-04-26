//
//  SettingsModel.swift
//  System Settings
//

import SwiftUI

enum SettingsOptions: String {
    case wifi = "Wi-Fi"
    case bluetooth = "Bluetooth"
    case network = "Network"
    case battery = "Battery"
    
    case general = "General"
    case accessibility = "Accessibility"
    case appearance = "Appearance"
    case siri = "Apple Intelligence & Siri"
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

let radioOptions: [SettingsItem] = [
    SettingsItem(type: .wifi, icon: "wifi", color: .blue, destination: AnyView(EmptyView())),
    SettingsItem(type: .bluetooth, icon: "bluetooth", color: .blue, destination: AnyView(EmptyView())),
    SettingsItem(type: .network, icon: "network", color: .blue, destination: AnyView(EmptyView())),
    SettingsItem(type: .battery, icon: "battery.100", color: .green, destination: AnyView(EmptyView()))
]

let mainOptions: [SettingsItem] = [
    SettingsItem(type: .general, icon: "gear", color: .gray, destination: AnyView(GeneralView())),
    SettingsItem(type: .accessibility, icon: "accessibility", color: .blue, destination: AnyView(EmptyView())),
    SettingsItem(type: .appearance, icon: "appearance.lightmode", color: .black, destination: AnyView(EmptyView())),
    SettingsItem(type: .siri, icon: "siri", destination: AnyView(EmptyView()))
]
