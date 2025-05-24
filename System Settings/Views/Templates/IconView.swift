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
            case "Apple Intelligence & Siri":
                Image(.appleIntelligenceSiri)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .symbolRenderingMode(.multicolor)
                    .foregroundStyle(.white.shadow(.drop(radius: 1, y: 0.5)))
                    .offset(y: -3)
            case "TimeMachine":
                Image(.timeMachine)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .symbolRenderingMode(.multicolor)
                    .foregroundStyle(.white.shadow(.drop(radius: 1, y: 0.5)))
                    .offset(x: -2)
            case "weather":
                Image(.weather)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .symbolRenderingMode(.multicolor)
                    .foregroundStyle(.white.shadow(.drop(radius: 1, y: 0.5)))
                    .offset(x: -2)
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
            case "play.fill", "moon.fill":
                Image(_internalSystemName: symbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
                    .foregroundStyle(.white.shadow(.drop(radius: 1, y: 0.5)))
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
