//
//  SettingsCell.swift
//  System Settings
//

import SwiftUI

struct SettingsCell: View {
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
            Image(_internalSystemName: symbol)
                .frame(width: 15, height: 15)
                .background(in:
                    RoundedRectangle(cornerRadius: 3.0)
                        .inset(by: -3.0)
                )
                .backgroundStyle(color.gradient)
                .foregroundStyle(.white.shadow(.drop(radius: 1, y: 1)))
                .padding(.leading, 3)
            Text(title)
        }
    }
}

#Preview {
    ContentView()
}
