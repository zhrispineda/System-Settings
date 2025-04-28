//
//  SettingsCell.swift
//  System Settings
//

import SwiftUI

struct SettingsCell: View {
    @Environment(\.appearsActive) var appearsActive
    let title: String
    let color: Color
    let symbol: String
    
    private let imageIcons: Set<String> = ["iCloud", "Wallet"]
    
    init(_ title: String, color: Color, symbol: String) {
        self.title = title
        self.color = color
        self.symbol = symbol
    }
    
    var body: some View {
        HStack {
            if color == .accentColor {
                if imageIcons.contains(symbol) {
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
                } else {
                    Image(title)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 25)
                        .padding(.leading, -2.5)
                        .padding(.trailing, -5)
                        .padding(.vertical, -2.5)
                }
            } else {
                IconView(symbol, color: color)
            }
            
            Text(title)
                .foregroundStyle(appearsActive ? .primary : .secondary)
        }
        .shadow(radius: 0.0, y: 0.3)
    }
}

#Preview {
    ContentView()
}
