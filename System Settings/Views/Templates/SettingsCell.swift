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
    let shadow: Bool
    
    init(_ title: String, subtitle: String = "", color: Color = .gray, symbol: String, shadow: Bool = true) {
        self.title = title
        self.subtitle = subtitle
        self.color = color
        self.symbol = symbol
        self.shadow = shadow
    }
    
    var body: some View {
        HStack {
            if color == .accentColor {
                switch symbol {
                case "FaceTime", "Find My", "Home", "Kerberos", "Messages", "Tips", "Wallet_Notification":
                    Image(symbol)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .padding(.leading, -2.5)
                        .padding(.trailing, -2)
                        .mask {
                            RoundedRectangle(cornerRadius: 5.0)
                                .foregroundStyle(color.gradient)
                                .shadow(radius: 0.3, y: 0.3)
                        }
                default:
                    Image(symbol)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, symbol == "iCloud" ? 2 : 0)
                        .frame(width: symbol == "Wallet" || symbol == "Game Center" || symbol == "iCloud" ? 24 : 20)
                        .mask {
                            RoundedRectangle(cornerRadius: 5.0)
                                .foregroundStyle(color.gradient)
                                .padding(.horizontal, symbol == "iCloud" ? 2 : 0)
                        }
                }
            } else if symbol.contains("com.") {
                TestIconView(icon: symbol, size: 24)
            } else if symbol == "TimeMachineSettingsIcon" {
                BundleIconView(bundlePath: "/System/Library/ExtensionKit/Extensions/TimeMachineSettings.appex", icon: symbol, size: 24)
            } else {
                IconView(symbol, color: color)
                    .shadow(radius: 0.0, y: 0.3)
            }
            
            LabeledContent {} label: {
                Text(title)
                    .foregroundStyle(appearsActive ? .primary : .secondary)
                    .padding(.leading, -2)
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
