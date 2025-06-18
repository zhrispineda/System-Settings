//
//  IconView.swift
//  System Settings
//

import SwiftUI
import UniformTypeIdentifiers

struct BundleIconView: View {
    let bundlePath: String
    let icon: String
    let size: CGFloat

    var body: some View {
        if let nsImage = iconImage {
            Image(nsImage: nsImage)
                .resizable()
                .frame(width: size, height: size)
        }
    }

    private var iconImage: NSImage? {
        guard let bundle = Bundle(path: bundlePath) else { return nil }

        if let image = bundle.image(forResource: NSImage.Name(icon)) {
            return image
        }

        if let iconFile = bundle.infoDictionary?["CFBundleIconFile"] as? String {
            let iconBaseName = (iconFile as NSString).deletingPathExtension
            return bundle.image(forResource: NSImage.Name(iconBaseName))
        }

        return nil
    }
}

// MARK: Experimental; to replace IconView
struct TestIconView: View {
    let icon: String
    let size: CGFloat

    var body: some View {
        if let type = UTType(icon) {
            let icon = NSWorkspace.shared.icon(for: type)
            Image(nsImage: icon)
                .resizable()
                .frame(width: size, height: size)
        }
    }
}

struct IconView: View {
    var symbol: String
    var color: Color
    var size: Int

    init(_ symbol: String, color: Color, size: Int = 19) {
        self.symbol = symbol
        self.color = color
        self.size = size
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .foregroundStyle(color.gradient)
                .scaledToFit()
                .frame(width: CGFloat(size), height: CGFloat(size))
            switch symbol {
            case "Apple Intelligence & Siri":
                Image(.appleIntelligenceSiri)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .symbolRenderingMode(.multicolor)
                    .foregroundStyle(.white.shadow(.drop(radius: 1, y: 0.5)))
                    .offset(y: -3)
            case "weather":
                Image(.weather)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .symbolRenderingMode(.multicolor)
                    .foregroundStyle(.white.shadow(.drop(radius: 1, y: 0.5)))
                    .offset(x: -2)
            case "touchid":
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
                    .font(.callout)
                    .frame(width: 14, height: 14)
                    .foregroundStyle(.white.shadow(.drop(radius: 1.5, y: 0.0)))
                    .padding([.top, .leading], symbol == "rectangle.and.hand.point.up.left.fill" ? 2 : 0)
            }
        }
    }
}

#Preview {
    ContentView()
}
