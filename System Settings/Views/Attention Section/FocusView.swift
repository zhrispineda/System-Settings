//
//  FocusView.swift
//  System Settings
//
//  System Settings > Focus
//

import SwiftUI

struct FocusView: View {
    @State private var table = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/FocusSettingsExtension.appex")
    @State private var shareFocus = false

    var body: some View {
        CustomForm(title: "FOCUS".localized(using: table)) {
            Section {
                NavigationLink {} label: {
                    SettingsCell("FOCUS".localized(using: table), symbol: "com.apple.graphic-icon.focus", larger: true)
                }
            } footer: {
                Button("ADD_FOCUS".localized(using: table)) {}.frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Section {
                Toggle(isOn: $shareFocus) {
                    Text("SHARE_ACROSS_DEVICES".localized(using: table))
                    Text("SHARING_UNAVAILABLE".localized(using: table))
                }
            }
            
            Section {
                NavigationLink {} label: {
                    LabeledContent {} label: {
                        HStack {
                            Text("FOCUS_STATUS_ITEM_HEADER".localized(using: table))
                            Spacer()
                            Text("OFF".localized(using: table))
                                .foregroundStyle(.secondary)
                        }
                        Text("FOCUS_STATUS_ITEM_SUBHEAD".localized(using: table))
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
