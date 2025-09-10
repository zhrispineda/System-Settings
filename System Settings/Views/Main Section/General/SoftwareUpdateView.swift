//
//  SoftwareUpdateView.swift
//  System Settings
//
//  System Settings > General > Software Update
//

import SwiftUI

struct SoftwareUpdateView: View {
    var body: some View {
        CustomForm(title: "Software Update", root: false) {
            Section {
                HStack {
                    Text("Checking for updates…")
                    Spacer()
                    ProgressView()
                        .controlSize(.small)
                }
            }
            
            Section {
                LabeledContent("Installed", value: "macOS Tahoe 26.0")
            }
            
            Section {
                HStack {
                    LabeledContent("Automatic Updates", value: "On")
                    Button("", systemImage: "info.circle") {
                        
                    }
                    .buttonStyle(.plain)
                    .imageScale(.large)
                    .foregroundStyle(.secondary)
                    .offset(x: 5)
                }
            }
            
            Section {
                Text("Use of this software is subject to the original license agreement that accompanied the software being updated. [Learn more…](#)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            } footer: {
                HelpButton(topicID: "mchla7037245")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    SoftwareUpdateView()
}
