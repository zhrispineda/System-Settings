//
//  SettingsModel.swift
//  System Settings
//

import SwiftUI

enum SettingsOptions: String {
    case general = "General"
    case accessibility = "Accessibility"
    case appearance = "Appearance"
}

struct SettingsItem: Identifiable, Hashable {
    var id: String { title }
    let type: SettingsOptions
    var title: String { type.rawValue }
    let icon: String
    var color: Color
    let destination: AnyView
    
    static func == (lhs: SettingsItem, rhs: SettingsItem) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

let mainOptions: [SettingsItem] = [
    SettingsItem(type: .general, icon: "gear", color: .gray, destination: AnyView(GeneralView())),
    SettingsItem(type: .accessibility, icon: "accessibility", color: .blue, destination: AnyView(EmptyView())),
    SettingsItem(type: .appearance, icon: "appearance.lightmode", color: .black, destination: AnyView(EmptyView()))
]
