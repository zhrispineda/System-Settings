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
                HStack {
                    Text("Name")
                    Spacer()
                    Text(Host.current().localizedName ?? macInfo.model().name)
                }
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
                .padding(.bottom, 8)
            }
            
            Section("macOS") {
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
            
            Section("Displays") {
                if let deviceImage = macInfo.color() {
                    Image(nsImage: deviceImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32)
                }
                Button("Display Settings…") {}.frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Section("Storage") {
                HStack {
                    TestIconView(icon: "com.apple.storage-internal", size: 32)
                    Text("\(macInfo.drives().name)")
                }
                Button("Storage Settings…") {}.frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Section {} header: {
                Button("System Report…") {
                    if let url = URL(string: "file:///System/Applications/Utilities/System%20Information.app") {
                        NSWorkspace.shared.open(url)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    AboutView()
        .frame(height: 600)
}
