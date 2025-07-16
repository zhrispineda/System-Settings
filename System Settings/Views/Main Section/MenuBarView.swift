//
//  MenuBarView.swift
//  System Settings
//
//  System Settings > Menu Bar
//

import SwiftUI

struct MenuBarView: View {
    @State private var table = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/ControlCenterSettings.appex")
    @State private var autoMenuBar = "In Full Screen Only"
    @State private var recentCount = "10"
    let autoMenuBarOptions = ["Always", "On Desktop Only", "In Full Screen Only", "Never"]
    let recentOptions = ["None", "5", "10", "15", "20", "30", "50"]
    
    var body: some View {
        CustomForm(title: "MENUBAR_SIDEBAR_TITLE".localized(using: table)) {
            Section {
                Picker("Automatically hide and show the menu bar".localized(using: table), selection: $autoMenuBar) {
                    ForEach(autoMenuBarOptions, id: \.self) { option in
                        Text(option.localized(using: table))
                    }
                }
                Picker("Recent documents, applications, and servers".localized(using: table), selection: $recentCount) {
                    ForEach(recentOptions, id: \.self) { option in
                        Text(option.localized(using: table))
                    }
                }
            }
            
            Section {} footer: {
                HelpButton(topicID: "mchlad96d366")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    MenuBarView()
        .frame(height: 700)
}

