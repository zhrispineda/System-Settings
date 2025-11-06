//
//  AboutView.swift
//  System Settings
//
//  System Settings > General > About
//

import SwiftUI

struct AboutView: View {
    @State private var showingBuild = false
    let icon = NSWorkspace.shared.icon(forFile: "/System/Applications/Weather.app")
    let appearancePath = "/System/Library/PrivateFrameworks/SystemDesktopAppearance.framework"
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
                    Text(Host.current().localizedName ?? MacInfo.shared.model().name)
                }
                LabeledContent("Chip", value: MGHelper.read(key: "Z06ZMtQY6G3kKrC7fs/gOA") ?? "Unknown")
                LabeledContent("Memory", value: "\(MacInfo.memory) GB")
                LabeledContent("Serial number", value: MGHelper.read(key: "VasUgeSzVyHdB27g2XpN0g") ?? "Unknown")
            } header: {
                HStack {
                    Spacer()
                    VStack(spacing: 0) {
                        if let deviceImage = MacInfo.shared.color() {
                            Image(nsImage: deviceImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140)
                        }
                        Text(MacInfo.shared.model().name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(MacInfo.shared.model().year)
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
                    Text("macOS \(MacInfo.shared.system().name)")
                    Spacer()
                    Text("Version \(MacInfo.shared.system().version)\(showingBuild ? " (\(buildNumber))" : "")")
                        .foregroundStyle(.secondary)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            showingBuild = true
                        }
                }
            }
            
            Section("Displays") {
                if let deviceImage = MacInfo.shared.color() {
                    Image(nsImage: deviceImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32)
                }
                Button("Display Settings…") {}.frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Section("Storage") {
                HStack {
                    IconView(icon: "com.apple.storage-internal", size: 32)
                    Text("\(MacInfo.shared.drives().name)")
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
            } footer: {
                VStack {
                    HStack {
                        Button("Software License Agreement") {
                            MacInfo.shared.softwareLicenseFile()
                        }
                        .buttonStyle(.plain)
                        .underline()
                        Text("-")
                        Button("Regulatory Certification") {
                            MacInfo.shared.regulatoryFile()
                        }
                        .buttonStyle(.plain)
                        .underline()
                    }
                    HStack {
                        Button("ENERGY STAR® Compliance") {
                            MacInfo.shared.energyStarFile()
                        }
                        .buttonStyle(.plain)
                        .underline()
                        Text("-")
                        Button("License Agreement") {
                            MacInfo.shared.openDocumentation()
                        }
                        .buttonStyle(.plain)
                        .underline()
                    }
                    Text("™ and © 1983-2025 Apple Inc. All Rights Reserved.")
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
