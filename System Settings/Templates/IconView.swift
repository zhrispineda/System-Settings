//
//  IconView.swift
//  System Settings
//

import SwiftUI

struct IconView: View {
    var symbol: String
    var color: Color
    
    init(_ symbol: String, color: Color) {
        self.symbol = symbol
        self.color = color
    }
    
    var body: some View {
        Image(_internalSystemName: symbol)
            .resizable()
            .scaledToFit()
            .frame(width: 15, height: 15)
            .background(in: RoundedRectangle(cornerRadius: 3.0).inset(by: -3.0))
            .backgroundStyle(color.gradient)
            .foregroundStyle(.white.shadow(.drop(radius: 1, y: 1)))
            .padding(.leading, 3)
    }
}

#Preview {
    ContentView()
}
