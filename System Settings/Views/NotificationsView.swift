//
//  NotificationsView.swift
//  System Settings
//
//  System Settings > Notifications
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        CustomForm(title: "Notifications") {
            Section {
                HStack(alignment: .top, spacing: 15) {
                    IconView("bell.badge.fill", color: .red)
                        .scaleEffect(1.3)
                        .padding(.top, 2)
                    VStack(alignment: .leading) {
                        Text("Notifications")
                        Text("Customize when and how notifications appear, if they play a sound, and which apps can send them. [Learn more…](help:anchor=mchl205da693)")
                            .foregroundStyle(.secondary)
                            .font(.footnote)
                    }
                }
                .padding([.leading, .trailing], 6)
            }
        }
    }
}

#Preview {
    NotificationsView()
}
