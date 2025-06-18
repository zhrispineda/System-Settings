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
            if symbol.contains("com.") {
                TestIconView(icon: symbol, size: 24)
                    .padding(.trailing, -2)
            } else {
                Image(_internalSystemName: symbol)
                    .font(.callout)
                    .frame(width: 14, height: 14)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    ContentView()
}
