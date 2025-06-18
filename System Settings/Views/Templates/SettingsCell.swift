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
    
    private let imageIcons: Set<String> = ["FaceTime", "Find My", "Home", "iCloud", "Kerberos", "Messages", "Wallet", "TimeMachine", "Tips", "Wallet_Notification"]
    
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
                if imageIcons.contains(symbol) {
                    switch symbol {
                    case "TimeMachine", "FaceTime", "Find My", "Home", "Kerberos", "Messages", "Tips", "Wallet_Notification":
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
                            .frame(width: symbol == "Wallet" ? 24 : 20)
                            .padding(.leading, symbol == "Wallet" ? -2 : 0)
                            .mask {
                                RoundedRectangle(cornerRadius: 5.0)
                                    .foregroundStyle(color.gradient)
                                    .shadow(radius: 0.3, y: 0.3)
                            }
                    }
                } else {
                    Image(title)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 25)
                        .padding(.leading, -2.5)
                        .padding(.trailing, -5)
                        .padding(.vertical, -2.5)
                }
            } else if symbol.contains("com.apple") {
                TestIconView(icon: symbol, size: 24)
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
