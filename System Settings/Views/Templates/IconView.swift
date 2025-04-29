//
//  IconView.swift
//  System Settings
//

import SwiftUI

struct IconView: View {
    var symbol: String
    var color: Color
    var size: Int
    
    init(_ symbol: String, color: Color, size: Int = 20) {
        self.symbol = symbol
        self.color = color
        self.size = size
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .foregroundStyle(color.gradient)
                .scaledToFit()
                .frame(width: 20, height: 20)
            switch symbol {
            case "airdrop", "touchid":
                Image(_internalSystemName: symbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .symbolRenderingMode(.multicolor)
                    .foregroundStyle(.white.shadow(.drop(radius: 1, y: 0.5)))
            case "calendar.badge.clock":
                Image(_internalSystemName: symbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(.white.shadow(.drop(radius: 1, y: 0.5)))
                    .padding(.top, 2)
                    .padding(.leading, 3)
            case "pencil.and.ellipsis.rectangle":
                Image(_internalSystemName: symbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(.white.shadow(.drop(radius: 1, y: 0.5)))
                    .padding([.bottom, .leading], 2)
            default:
                Image(_internalSystemName: symbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(.white.shadow(.drop(radius: 1, y: 0.5)))
                    .padding([.top, .leading], symbol == "rectangle.and.hand.point.up.left.fill" ? 2 : 0)
            }
        }
    }
}

#Preview {
    ContentView()
}
