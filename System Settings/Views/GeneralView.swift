//
//  GeneralView.swift
//  System Settings
//
//  System Settings > General
//

import SwiftUI

struct GeneralView: View {
    @State private var titleOpacity = 0.0
    let table = "General"
    
    var body: some View {
        CustomForm(title: "General".localize(table: table)) {
            // Placard
            Section {
                VStack(spacing: 5) {
                    IconView("gear", color: .gray)
                        .scaleEffect(3.2)
                        .padding(.top, 30)
                        .overlay {
                            DividerGeometryView(dividerOpacity: $titleOpacity)
                        }
                    Text("General", tableName: table)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    Text("Manage your overall setup and preferences for Mac, such as software updates, device language, AirDrop, and more.", tableName: table)
                        .foregroundStyle(.secondary)
                        .font(.callout)
                        .padding(.bottom, 5)
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .navigationTitle(titleOpacity > 37.0 ? "General".localize(table: table) : "")
            }
            
            Section {
                NavigationLink(value: "About") {
                    SettingsCell("About", color: .gray, symbol: "macbook")
                }
                NavigationLink(value: "Software Update") {
                    SettingsCell("Software Update", color: .gray, symbol: "gear.badge")
                }
                NavigationLink(value: "Storage") {
                    SettingsCell("Storage", color: .gray, symbol: "externaldrive.fill")
                }
            }
            
            Section {
                NavigationLink(value: "AppleCare & Warranty") {
                    SettingsCell("AppleCare & Warranty", color: .accentColor, symbol: "Coverage")
                }
            }
            
            Section {
                NavigationLink(value: "AirDrop & Handoff") {
                    SettingsCell("AirDrop & Handoff", color: .white, symbol: "airdrop")
                }
            }
            
            Section {
                NavigationLink(value: "AutoFill & Passwords") {
                    SettingsCell("AutoFill & Passwords", color: .gray, symbol: "pencil.and.ellipsis.rectangle")
                }
                NavigationLink(value: "Date & Time") {
                    SettingsCell("Date & Time", color: .blue, symbol: "calendar.badge.clock")
                }
                NavigationLink(value: "Language & Region") {
                    SettingsCell("Language & Region", color: .blue, symbol: "globe")
                }
                NavigationLink(value: "Login Items & Extensions") {
                    SettingsCell("Login Items & Extensions", color: .gray, symbol: "list.bullet")
                }
                NavigationLink(value: "Sharing") {
                    SettingsCell("Sharing", color: .gray, symbol: "figure.walk.diamond.fill")
                }
                NavigationLink(value: "Startup Disk") {
                    SettingsCell("Startup Disk", color: .gray, symbol: "externaldrive.fill")
                }
                NavigationLink(value: "Time Machine") {
                    SettingsCell("Time Machine", color: .accentColor, symbol: "TimeMachine")
                }
            }
            
            Section {
                NavigationLink(value: "Device Management") {
                    SettingsCell("Device Management", color: .gray, symbol: "checkmark.seal.fill")
                }
            }
            
            Section {
                NavigationLink(value: "Transfer or Reset") {
                    SettingsCell("Transfer or Reset", color: .gray, symbol: "arrow.counterclockwise")
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .frame(height: 500)
}
