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

struct IconView: View {
    let icon: String
    let size: CGFloat
    
    var body: some View {
        if let type = UTType(icon) {
            let icon = NSWorkspace.shared.icon(for: type)
            Image(nsImage: icon)
                .resizable()
                .frame(width: size, height: size)
        } else if let bundleIcon = getIcon(bundleID: icon) {
            Image(nsImage: bundleIcon)
                .resizable()
                .frame(width: size, height: size)
        }
    }
}

#Preview {
    ContentView()
}
