//
//  FocusView.swift
//  System Settings
//
//  System Settings > Focus
//

import SwiftUI

struct FocusView: View {
    @State private var shareFocus = false
    
    var body: some View {
        CustomForm(title: "Focus") {
            Section {
                NavigationLink {} label: {
                    SettingsCell("Focus", symbol: "com.apple.graphic-icon.focus", larger: true)
                }
            } footer: {
                Button("Add Focus…") {}.frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Section {
                Toggle(isOn: $shareFocus) {
                    Text("Share across devices")
                    Text("Sharing from this device is currently unavailable.")
                }
            }
            
            Section {
                NavigationLink {} label: {
                    LabeledContent {} label: {
                        HStack {
                            Text("Focus status")
                            Spacer()
                            Text("Off")
                                .foregroundStyle(.secondary)
                        }
                        Text("When you give an app permission, it can share that you have notifications silenced when using Focus.")
                    }
                }
            }
            
            Section {} footer: {
                HelpButton(topicID: "mchlff5da36d")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    NavigationStack {
        FocusView()
    }
}
