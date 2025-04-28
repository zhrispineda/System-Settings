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
    
    init(_ title: String, color: Color, symbol: String) {
        self.title = title
        self.color = color
        self.symbol = symbol
    }
    
    var body: some View {
        HStack {
            if color == .accentColor {
                Image(title)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 25)
                    .padding(.leading, -2.5)
                    .padding(.trailing, -5)
                    .padding(.vertical, -2.5)
            } else {
                IconView(symbol, color: color)
            }
            
            Text(title)
                .foregroundStyle(appearsActive ? .primary : .secondary)
        }
    }
}

#Preview {
    ContentView()
}
