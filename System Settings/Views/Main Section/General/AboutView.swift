//
//  AboutView.swift
//  System Settings
//
//  System Settings > General > About
//

import SwiftUI

struct AboutView: View {
    let icon = NSWorkspace.shared.icon(forFile: "/System/Applications/Weather.app")
    let appearancePath = "/System/Library/PrivateFrameworks/SystemDesktopAppearance.framework"
    let macInfo = MacInfo()
    let buildNumber: String = {
        if let dict = NSDictionary(contentsOfFile: "/System/Library/CoreServices/SystemVersion.plist"),
           let build = dict["ProductBuildVersion"] as? String {
            return build
        }
        return "Unknown"
    }()
    
    var body: some View {
        CustomForm(title: "About", root: false) {
            Section {
                LabeledContent("Name", value: Host.current().localizedName ?? macInfo.model().name)
                LabeledContent("Chip", value: MGHelper.read(key: "Z06ZMtQY6G3kKrC7fs/gOA") ?? "Unknown")
                LabeledContent("Memory", value: "\(MacInfo.memory) GB")
                LabeledContent("Serial number", value: MGHelper.read(key: "VasUgeSzVyHdB27g2XpN0g") ?? "Unknown")
            } header: {
                HStack {
                    Spacer()
                    VStack(spacing: 0) {
                        if let deviceImage = macInfo.color() {
                            Image(nsImage: deviceImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140)
                        }
                        Text(macInfo.model().name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(macInfo.model().year)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundStyle(.tertiary)
                    }
                    Spacer()
                }
            }
            
            Section("macOS") {
                if let dict = NSDictionary(contentsOfFile: "/System/Library/CoreServices/SystemVersion.plist"),
                   let build = dict["ProductBuildVersion"] as? String {
                    let _ = print("macOS build number: \(build)")
                }
                HStack {
                    if let logo = NSImage.asset(path: appearancePath, name: "AboutThisMacRoundel") {
                        Image(nsImage: logo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                    }
                    LabeledContent("macOS \(macInfo.system().name)", value: "Version \(macInfo.system().version) (\(buildNumber))")
                }
            }
        }
    }
}

#Preview {
    AboutView()
        .frame(height: 600)
}
