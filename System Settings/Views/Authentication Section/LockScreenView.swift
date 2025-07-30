//
//  LockScreenView.swift
//  System Settings
//
//  System Settings > Lock Screen
//

import SwiftUI

struct LockScreenView: View {
    @State private var displayOffBattery = "For 10 minutes"
    @State private var displayOffPower = "For 10 minutes"
    @State private var requirePassword = "After 5 minutes"
    @State private var showUserPhoto = true
    @State private var passwordHints = false
    @State private var lockedMessage = false
    @State private var loginWindow = "List of users"
    @State private var showButtons = true
    let displayOptions = ["For 1 minute", "For 2 minutes", "For 3 minutes", "For 5 minutes", "For 10 minutes", "For 20 minutes", "For 30 minutes", "For 1 hour", "For 1 hour, 30 minutes", "For 2 hours", "For 2 hours, 30 minutes", "For 3 hours", "Never"]
    let passOptions = ["Immediately", "After 5 seconds", "After 1 minute", "After 5 minutes", "After 15 minutes", "After 1 hour", "After 4 hours", "After 8 hours", "Never"]
    let loginOptions = ["List of users", "Name and password"]
    
    var body: some View {
        CustomForm(title: "Lock Screen") {
            Section {
                Picker("Turn display off on battery when inactive", selection: $displayOffBattery) {
                    ForEach(displayOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                Picker("Turn display off on power adapter when inactive", selection: $displayOffPower) {
                    ForEach(displayOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                Picker("Require password after screen saver begins or display is turned off", selection: $requirePassword) {
                    ForEach(passOptions, id: \.self) { option in
                        Text(option)
                    }
                }
            }
            
            Section {
                Toggle("Show user name and photo", isOn: $showUserPhoto)
                Toggle("Show password hints", isOn: $passwordHints)
                HStack {
                    Toggle("Show message when locked", isOn: $lockedMessage)
                    Button("Set…") {}.disabled(!lockedMessage)
                }
            }
            
            Section {
                Picker("Login window shows", selection: $loginWindow) {
                    ForEach(loginOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                .pickerStyle(.inline)
                Toggle("Show the Sleep, Restart, and Shut Down buttons", isOn: $showButtons)
            } header: {
                Text("When Switching User")
            } footer: {
                HStack {
                    Button("Accessibility Options…") {}
                    HelpButton(topicID: "mh11784")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    LockScreenView()
}
