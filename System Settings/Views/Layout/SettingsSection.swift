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
                    if selection == setting && !path.isEmpty {
                        Button  {
                            path = NavigationPath()
                        } label: {
                            HStack(spacing: 8) {
                                IconView(setting.icon, color: .gray)
                                    .shadow(radius: 0.0, y: 0.3)
                                Text(setting.title)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .contentShape(Rectangle())
                            .padding(.leading, 2)
                        }
                        .buttonStyle(SelectedButtonStyle())
                    } else {
                        SettingsCell(setting.title, color: setting.color, symbol: setting.icon)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }
}

struct SelectedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 4)
            .background(
                RoundedRectangle(cornerRadius: 5.0)
                    .foregroundStyle(configuration.isPressed ? Color(NSColor.selectedContentBackgroundColor).opacity(0.2) : Color.clear)
                    .padding(.vertical, -4)
            )
            ._safeAreaInsets(EdgeInsets(top: 0, leading: -6, bottom: 0, trailing: -6))
    }
}

#Preview {
    ContentView()
        .frame(height: 500)
}
