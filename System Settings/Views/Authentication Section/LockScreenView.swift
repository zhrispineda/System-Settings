//
//  LockScreenView.swift
//  System Settings
//
//  System Settings > Lock Screen
//

import SwiftUI

struct LockScreenView: View {
    @State private var table = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/LockScreen.appex")
    @State private var displayOffBattery = "10 minutes"
    @State private var displayOffPower = "10 minutes"
    @State private var requirePassword = "5 minutes"
    @State private var showUserPhoto = true
    @State private var passwordHints = false
    @State private var lockedMessage = false
    @State private var loginWindow = "List of users"
    @State private var showButtons = true
    let displayOptions = ["1 minute", "2 minutes", "3 minutes", "5 minutes", "10 minutes", "20 minutes", "30 minutes", "1 hour", "1 hour, 30 minutes", "2 hours", "2 hours, 30 minutes", "3 hours", "Never"]
    let passOptions = ["Immediately", "5 seconds", "1 minute", "5 minutes", "15 minutes", "1 hour", "4 hours", "8 hours", "Never"]
    let loginOptions = ["List of users", "Name and password"]
    
    var body: some View {
        CustomForm(title: "Lock Screen") {
            Section {
                Picker("Turn display off on battery when inactive".localized(using: table), selection: $displayOffBattery) {
                    ForEach(displayOptions, id: \.self) { option in
                        if passOptions.last != option {
                            Text("For %@".localizedFormatted(using: table, option))
                        } else {
                            Text(option.localized(using: table))
                        }
                    }
                }
                Picker("Turn display off on power adapter when inactive".localized(using: table), selection: $displayOffPower) {
                    ForEach(displayOptions, id: \.self) { option in
                        if passOptions.last != option {
                            Text("For %@".localizedFormatted(using: table, option))
                        } else {
                            Text(option.localized(using: table))
                        }
                    }
                }
                Picker("Require password after screen saver begins or display is turned off".localized(using: table), selection: $requirePassword) {
                    ForEach(passOptions, id: \.self) { option in
                        if passOptions.first != option && passOptions.last != option {
                            Text("After %@".localizedFormatted(using: table, option))
                        } else {
                            Text(option.localized(using: table))
                        }
                    }
                }
            }
            
            Section {
                Toggle("Show user name and photo".localized(using: table), isOn: $showUserPhoto)
                Toggle("Show password hints".localized(using: table), isOn: $passwordHints)
                HStack {
                    Toggle("Show message when locked".localized(using: table), isOn: $lockedMessage)
                    Button("Set…".localized(using: table)) {}.disabled(!lockedMessage)
                }
            }
            
            Section {
                Picker("Login window shows".localized(using: table), selection: $loginWindow) {
                    ForEach(loginOptions, id: \.self) { option in
                        Text(option.localized(using: table))
                    }
                }
                .pickerStyle(.inline)
                Toggle("Show the Sleep, Restart, and Shut Down buttons".localized(using: table), isOn: $showButtons)
            } header: {
                Text("When Switching User".localized(using: table))
            } footer: {
                HStack {
                    Button("Accessibility Options…".localized(using: table)) {}
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
