//
//  SettingsCell.swift
//  System Settings
//

import SwiftUI

struct SettingsCell: View {
    @Environment(\.appearsActive) var appearsActive
    let title: String
    let subtitle: String
    let color: Color
    let symbol: String
    let icon: String
    let shadow: Bool
    let sidebar: Bool
    let larger: Bool

    init(
        _ title: String,
        subtitle: String = "",
        color: Color = .gray,
        symbol: String,
        icon: String = "AppIcon",
        shadow: Bool = true,
        sidebar: Bool = false,
        larger: Bool = false
    ) {
        self.title = title
        self.subtitle = subtitle
        self.color = color
        self.symbol = symbol
        self.icon = icon
        self.shadow = shadow
        self.sidebar = sidebar
        self.larger = larger
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                if symbol.contains("com.") {
                    IconView(icon: symbol, size: larger ? 31 : 24)
                        .padding(.leading, -2)
                } else if symbol.contains("/") {
                    BundleIconView(bundlePath: symbol, icon: icon, size: larger ? 31 : 24)
                }
            }
            .frame(width: subtitle.isEmpty ? 30 : 38, alignment: .leading)

            LabeledContent {} label: {
                Text(title)
                    .foregroundStyle(appearsActive ? .primary : .secondary)
                    .padding(.leading, sidebar ? -5 : 0)
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .foregroundStyle(appearsActive ? .secondary : .tertiary)
                }
            }
        }
        .frame(height: 22)
    }
}

#Preview {
    ContentView()
        .environment(SettingsViewModel())
}
