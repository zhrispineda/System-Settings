//
//  NotificationsView.swift
//  System Settings
//
//  System Settings > Notifications
//

import SwiftUI

struct NotificationsView: View {
    @State private var showPreviews = "When Unlocked"
    @State private var notifyWhenSleep = false
    @State private var notifyWhenLocked = true
    @State private var notifyWhenMirroring = false
    let previewOptions = ["Always", "When Unlocked", "Never"]
    
    var body: some View {
        CustomForm(title: "Notifications") {
            Section {
                HStack(alignment: .top, spacing: 15) {
                    TestIconView(icon: "com.apple.graphic-icon.notifications", size: 32)
                        .padding(.horizontal, -6)
                    VStack(alignment: .leading) {
                        Text("Notifications")
                        Text("Customize when and how notifications appear, if they play a sound, and which apps can send them. [Learn more…](help:anchor=mchl205da693)")
                            .foregroundStyle(.secondary)
                            .font(.footnote)
                    }
                }
                .padding([.leading, .trailing], 6)
            }
            
            Section {
                Picker("Show previews", selection: $showPreviews) {
                    ForEach(previewOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                Toggle("Allow notifications when the display is sleeping", isOn: $notifyWhenSleep)
                Toggle("Allow notifications when the screen is locked", isOn: $notifyWhenLocked)
                Toggle("Allow notifications when mirroring or sharing the display", isOn: $notifyWhenMirroring)
            } header: {
                Text("Notification Center")
                Text("Notification Center shows your notifications in the top-right corner of your screen. You can show and hide Notification Center by clicking the clock in the menu bar.")
            }

            Section {
                NavigationLink(value: "FaceTime") {
                    SettingsCell("FaceTime", subtitle: "Badges, Sounds, Banners", symbol: "/System/Applications/FaceTime.app")
                }
                NavigationLink(value: "Find My") {
                    SettingsCell("Find My", subtitle: "Badges, Sounds", symbol: "/System/Applications/FindMy.app")
                }
                NavigationLink(value: "Home") {
                    SettingsCell("Home", subtitle: "Badges, Sounds, Time Sensitive", symbol: "/System/Applications/Home.app")
                }
                NavigationLink(value: "Kerberos") {
                    SettingsCell("Kerberos", subtitle: "Badges, Sounds, Alerts", symbol: "/System/Library/CoreServices/SecurityAgentPlugins/KerberosAgent.bundle", icon: "KerberosApp")
                }
                NavigationLink(value: "Messages") {
                    SettingsCell("Messages", subtitle: "Badges, Sounds, Banners, Critical", symbol: "/System/Applications/Messages.app")
                }
                NavigationLink(value: "Tips") {
                    SettingsCell("Tips", subtitle: "Alerts", symbol: "/System/Applications/Tips.app")
                }
                NavigationLink(value: "Wallet") {
                    SettingsCell("Wallet", subtitle: "Badges, Sounds, Time Sensitive", color: .accentColor, symbol: "Wallet_Notification")
                }
            } header: {
                Text("Application Notifications")
            } footer: {
                HelpButton(topicID: "mh40583")
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
