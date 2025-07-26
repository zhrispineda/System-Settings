//
//  IconView.swift
//  System Settings
//

import SwiftUI
import UniformTypeIdentifiers

func getIcon(path: String) -> NSImage? {
    guard FileManager.default.fileExists(atPath: path) else {
        return nil
    }
    return NSWorkspace.shared.icon(forFile: path)
}

func getIcon(bundleID: String) -> NSImage? {
    guard let appURL = NSWorkspace.shared.urlForApplication(withBundleIdentifier: bundleID) else {
        return nil
    }
    return getIcon(path: appURL.path)
}


struct BundleIconView: View {
    let bundlePath: String
    var icon: String = "AppIcon"
    let size: CGFloat

    var body: some View {
        if let nsImage = iconImage {
            Image(nsImage: nsImage)
                .resizable()
                .frame(width: size, height: size)
        } else if let bundleIcon = getIcon(path: bundlePath) {
            Image(nsImage: bundleIcon)
                .resizable()
                .frame(width: size, height: size)
                .padding(.leading, -2)
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
        } else {
            if let bundleIcon = getIcon(bundleID: icon) {
                Image(nsImage: bundleIcon)
                    .resizable()
                    .frame(width: size, height: size)
            }
        }
    }
}

struct IconView: View {
    var symbol: String
    var color: Color
    var size: Int

    init(_ symbol: String, color: Color = .blue, size: Int = 19) {
        self.symbol = symbol
        self.color = color
        self.size = size
    }

    var body: some View {
        ZStack {
            if symbol.contains("com.") {
                TestIconView(icon: symbol, size: 24)
                    .padding(.trailing, -2)
            } else {
                RoundedRectangle(cornerRadius: 5.0)
                    .foregroundStyle(color.gradient)
                    .scaledToFit()
                    .frame(width: CGFloat(size), height: CGFloat(size))
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
