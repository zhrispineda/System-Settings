//
//  ContentView.swift
//  System Settings
//

import SwiftUI

struct ContentView: View {
    @Environment(\.appearsActive) var appearsActive
    @FocusState private var isFocused: Bool
    @State private var path = NavigationPath()
    @State private var searchText = ""
    @State private var selection: SettingsItem? = mainOptions.first
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                // MARK: Apple Account
                Section {
                    ForEach(accountOptions) { setting in
                        NavigationLink(value: setting) {
                            AppleAccountCell()
                        }
                    }
                }
                
                // MARK: Radio + Battery/Power
                SettingsSection(path: $path, selection: $selection, options: radioOptions)
                
                // MARK: Main
                SettingsSection(path: $path, selection: $selection, options: mainOptions)
                
                // MARK: Focus
                SettingsSection(path: $path, selection: $selection, options: focusOptions)
                
                // MARK: Authentication
                SettingsSection(path: $path, selection: $selection, options: authOptions)
                
                // MARK: Services
                SettingsSection(path: $path, selection: $selection, options: serviceOptions)
                
                // MARK: Input
                SettingsSection(path: $path, selection: $selection, options: inputOptions)
            }
            .searchable(text: $searchText, placement: .sidebar)
            .focused($isFocused)
            .opacity(appearsActive ? 1.0 : 0.5)
            .onAppear {
                isFocused = true
            }
            .toolbar(removing: .sidebarToggle)
            .navigationSplitViewColumnWidth(215)
        } detail: {
            NavigationStack(path: $path) {
                selection?.destination
            }
        }
    }
}

#Preview {
    ContentView()
        .frame(width: 715, height: 700)
}
