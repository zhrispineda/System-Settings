//
//  NotificationsView.swift
//  System Settings
//
//  System Settings > Notifications
//

import SwiftUI

struct NotificationsView: View {
    @State private var table = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/NotificationsSettings.appex")
    @State private var showPreviews = "When Unlocked"
    @State private var notifyWhenSleep = false
    @State private var notifyWhenLocked = true
    @State private var notifyWhenMirroring = "Notifications Off"
    let previewOptions = ["Always", "When Unlocked", "Never"]
    let mirrorOptions = ["Notifications Off", "Allow Notifications"]
    
    var body: some View {
        CustomForm(title: "Notifications".localized(using: table)) {
            Section {
                Placard(icon: "com.apple.graphic-icon.notifications") {
                    Text("Notifications".localized(using: table))
                    Text(.init("Customize when and how notifications appear, if they play a sound, and which apps can send them. [Learn more…](help:anchor=mchl205da693%20bookID=com.apple.machelp)".localized(using: table)))
                }
            }
            
            Section {
                Picker("Show previews".localized(using: table), selection: $showPreviews) {
                    ForEach(previewOptions, id: \.self) { option in
                        Text(option.localized(using: table))
                    }
                }
                Text("Show Notifications:".localized(using: table))
                    .listRowInsets(EdgeInsets(top: 0, leading: 90, bottom: 0, trailing: 0))
                Group {
                    VStack {
                        Toggle("when display is sleeping".localized(using: table), isOn: $notifyWhenSleep)
                        Divider()
                        Toggle("when screen is locked".localized(using: table), isOn: $notifyWhenLocked)
                        Divider()
                        Picker("when mirroring or sharing the display".localized(using: table), selection: $notifyWhenMirroring) {
                            ForEach(mirrorOptions, id: \.self) { option in
                                Text(option.localized(using: table))
                            }
                        }
                    }
                }
                .padding(.leading, 30)
            } header: {
                Text("Notification Center".localized(using: table))
                Text("Notification Center shows your notifications in the top-right corner of your screen. You can show and hide Notification Center by clicking the clock in the menu bar.".localized(using: table))
            }

            Section {
                NavigationLink(value: "FaceTime") {
                    SettingsCell("FaceTime", subtitle: "Badges, Sounds, Banners", symbol: "/System/Applications/FaceTime.app/Contents/PlugIns/RemotePeoplePicker.appex", larger: true)
                }
                NavigationLink(value: "Find My") {
                    SettingsCell("Find My", subtitle: "Badges, Sounds", symbol: "/System/Applications/FindMy.app/Contents/PlugIns/FindMyNotificationsService.appex", larger: true)
                }
                NavigationLink(value: "Home") {
                    SettingsCell("Home", subtitle: "Badges, Sounds, Time Sensitive", symbol: "com.apple.Home", larger: true)
                }
                NavigationLink(value: "Kerberos") {
                    SettingsCell("Kerberos", subtitle: "Badges, Sounds, Alerts", symbol: "/System/Library/CoreServices/SecurityAgentPlugins/KerberosAgent.bundle", larger: true)
                }
                NavigationLink(value: "Messages") {
                    SettingsCell("Messages", subtitle: "Badges, Sounds, Banners, Critical", symbol: "/System/Applications/Messages.app", larger: true)
                }
                NavigationLink(value: "Tips") {
                    SettingsCell("Tips", subtitle: "Alerts", symbol: "/System/Applications/Tips.app", larger: true)
                }
                NavigationLink(value: "Wallet") {
                    SettingsCell("Wallet", subtitle: "Badges, Sounds, Time Sensitive", symbol: "com.apple.application-icon.pass-viewer.wallet", larger: true)
                }
            } header: {
                Text("Application Notifications".localized(using: table))
            } footer: {
                HStack {
                    HelpButton(topicID: "mh40583")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    NavigationStack {
        NotificationsView()
    }
    .frame(height: 700)
}
