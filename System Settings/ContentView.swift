//
//  ContentView.swift
//  System Settings
//

import SwiftUI

struct ContentView: View {
    @Environment(SettingsViewModel.self) private var model
    @Environment(\.appearsActive) var appearsActive
    @FocusState private var isFocused: Bool
    @State private var path = NavigationPath()
    @State private var searchText = ""
    @State private var selection: SettingsItem? = nil
    /// Returns an extra width value based on preferred language.
    var extraWidth: CGFloat {
        switch Locale.preferredLanguages.first {
        case "el", "vi":
            return 30
        case "de", "ja":
            return 10
        default:
            return 0
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                // MARK: Apple Account
                Section {
                    ForEach(model.accountOptions) { setting in
                        NavigationLink(value: setting) {
                            AppleAccountCell()
                        }
                    }
                }
                
                // MARK: Radio + Battery/Power
                SettingsSection(path: $path, selection: $selection, options: model.radioOptions)
                
                // MARK: Main
                SettingsSection(path: $path, selection: $selection, options: model.mainOptions)
                
                // MARK: Focus
                SettingsSection(path: $path, selection: $selection, options: model.focusOptions)
                
                // MARK: Authentication
                SettingsSection(path: $path, selection: $selection, options: model.authOptions)
                
                // MARK: Services
                SettingsSection(path: $path, selection: $selection, options: model.serviceOptions)
                
                // MARK: Input
                SettingsSection(path: $path, selection: $selection, options: model.inputOptions)
            }
            .searchable(text: $searchText, placement: .sidebar)
            .focused($isFocused)
            .opacity(appearsActive ? 1.0 : 0.5)
            .onAppear {
                isFocused = true
                if selection == nil {
                    selection = model.mainOptions.first
                }
            }
            .toolbar(removing: .sidebarToggle)
            .navigationSplitViewColumnWidth(215 + extraWidth)
        } detail: {
            NavigationStack(path: $path) {
                selection?.destination
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(SettingsViewModel())
        .frame(width: 715, height: 700)
}
