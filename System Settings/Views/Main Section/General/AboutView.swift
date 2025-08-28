//
//  AboutView.swift
//  System Settings
//
//  System Settings > General > About
//

import SwiftUI

struct AboutView: View {
    let macInfo = MacInfo()
    
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
        }
    }
}

#Preview {
    AboutView()
}
