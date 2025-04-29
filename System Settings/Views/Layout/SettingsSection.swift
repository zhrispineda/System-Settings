//
//  SettingsSection.swift
//  System Settings
//

import SwiftUI

struct SettingsSection: View {
    @Binding var path: NavigationPath
    @Binding var selection: SettingsItem?
    let options: [SettingsItem]
    
    var body: some View {
        Section {
            ForEach(options) { setting in
                NavigationLink(value: setting) {
                    ZStack {
                        SettingsCell(setting.title, color: setting.color, symbol: setting.icon)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        if selection == setting {
                            SettingsCell("", color: setting.color, symbol: setting.icon, shadow: false)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    path = NavigationPath()
                                }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
