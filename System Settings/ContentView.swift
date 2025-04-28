//
//  ContentView.swift
//  System Settings
//

import SwiftUI

struct ContentView: View {
    @Environment(\.appearsActive) var appearsActive
    @State private var dividerOpacity = 0.0
    @State private var searchText = ""
    @State private var selection: SettingsItem? = mainOptions.first
    @State private var sidebarOpacity = 1.0
    
    var body: some View {
        NavigationSplitView {
            List {}
                .frame(height: 30)
                .scrollDisabled(true)
                .searchable(text: $searchText, placement: .sidebar)
                .navigationSplitViewColumnWidth(215)
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
                Section {
                    ForEach(radioOptions) { setting in
                        NavigationLink(value: setting) {
                            SettingsCell(setting.title, color: setting.color, symbol: setting.icon)
                        }
                    }
                }
                
                // MARK: Main
                Section {
                    ForEach(mainOptions) { setting in
                        NavigationLink(value: setting) {
                            SettingsCell(setting.title, color: setting.color, symbol: setting.icon)
                        }
                    }
                }
                
                // MARK: Focus
                Section {
                    ForEach(focusOptions) { setting in
                        NavigationLink(value: setting) {
                            SettingsCell(setting.title, color: setting.color, symbol: setting.icon)
                        }
                    }
                }
                
                // MARK: Authentication
                Section {
                    ForEach(authOptions) { setting in
                        NavigationLink(value: setting) {
                            SettingsCell(setting.title, color: setting.color, symbol: setting.icon)
                        }
                    }
                }
                
                // MARK: Services
                Section {
                    ForEach(serviceOptions) { setting in
                        NavigationLink(value: setting) {
                            SettingsCell(setting.title, color: setting.color, symbol: setting.icon)
                        }
                    }
                }
                
                // MARK: Input
                Section {
                    ForEach(inputOptions) { setting in
                        NavigationLink(value: setting) {
                            SettingsCell(setting.title, color: setting.color, symbol: setting.icon)
                        }
                    }
                }
            }
            .opacity(appearsActive ? 1.0 : 0.5)
            .overlay {
                Divider()
                    .frame(maxHeight: .infinity, alignment: .top)
                    .opacity(dividerOpacity)
            }
            .toolbar(removing: .sidebarToggle)
        } detail: {
            NavigationStack {
                Form {
                    selection?.destination
                }
                .formStyle(.grouped)
                ._safeAreaInsets(EdgeInsets(top: -19, leading: 0, bottom: 0, trailing: 0))
                .navigationTitle(selection?.title ?? "")
                .navigationSplitViewColumnWidth(500)
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        HStack {
                            Button("", systemImage: "chevron.left") {}
                                .disabled(true)
                            Button("", systemImage: "chevron.right") {}
                                .disabled(true)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .frame(height: 500)
}
