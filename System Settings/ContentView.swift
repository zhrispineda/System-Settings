//
//  ContentView.swift
//  System Settings
//

import SwiftUI

struct ContentView: View {
    @Environment(\.appearsActive) var appearsActive
    @FocusState private var isFocused: Bool
    @State private var dividerOpacity = 0.0
    @State private var path = NavigationPath()
    @State private var searchText = ""
    @State private var selection: SettingsItem? = mainOptions.first
    
    var body: some View {
        NavigationSplitView {
            List {}
                .frame(height: 0)
                .scrollDisabled(true)
                .searchable(text: $searchText, placement: .sidebar)
                .navigationSplitViewColumnWidth(215)
            if searchText.isEmpty {
                List(selection: $selection) {
                    // MARK: Apple Account
                    Section {
                        ForEach(accountOptions) { setting in
                            NavigationLink(value: setting) {
                                AppleAccountCell()
                                    .overlay {
                                        DividerGeometryView(dividerOpacity: $dividerOpacity)
                                    }
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
                .focused($isFocused)
                .opacity(appearsActive ? 1.0 : 0.5)
                .onAppear {
                    isFocused = true
                }
                .overlay {
                    Divider()
                        .frame(maxHeight: .infinity, alignment: .top)
                        .opacity(dividerOpacity)
                }
                .toolbar(removing: .sidebarToggle)
            } else {
                SearchView(searchText: $searchText)
            }
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
