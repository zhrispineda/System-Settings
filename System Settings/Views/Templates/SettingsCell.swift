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

    init(_ title: String, subtitle: String = "", color: Color = .gray, symbol: String, icon: String = "AppIcon", shadow: Bool = true, sidebar: Bool = false) {
        self.title = title
        self.subtitle = subtitle
        self.color = color
        self.symbol = symbol
        self.icon = icon
        self.shadow = shadow
        self.sidebar = sidebar
    }
    
    var body: some View {
        HStack {
            if color == .accentColor {
                Image(symbol)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .mask {
                        RoundedRectangle(cornerRadius: 5.0)
                            .foregroundStyle(color.gradient)
                    }
            } else if symbol.contains("com.") {
                TestIconView(icon: symbol, size: 24)
                    .padding(.leading, sidebar ? -2 : 0)
            } else if symbol.contains("/") {
                BundleIconView(bundlePath: symbol, icon: icon, size: 24)
                    .padding(.leading, symbol.contains("Wallet") ? -2 : 0)
            } else {
                IconView(symbol, color: color)
                    .shadow(radius: 0.0, y: 0.3)
            }

            LabeledContent {} label: {
                Text(title)
                    .foregroundStyle(appearsActive ? .primary : .secondary)
                    .padding(.leading, sidebar ? -5 : -2)
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .foregroundStyle(appearsActive ? .secondary : .tertiary)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
