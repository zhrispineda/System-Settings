//
//  ContentView.swift
//  System Settings
//

import SwiftUI

struct ContentView: View {
    @Environment(SettingsViewModel.self) private var model
    @Environment(\.appearsActive) var appearsActive
    @FocusState private var isFocused: Bool
    @State private var searchText = ""
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
        @Bindable var model = model
        
        NavigationSplitView {
            List(selection: $model.selectedOption) {
                // MARK: Apple Account
                Section {
                    ForEach(model.accountOptions) { setting in
                        NavigationLink(value: setting) {
                            AppleAccountCell()
                        }
                    }
                }
                
                // MARK: Radio + Battery/Power
                SettingsSection(options: model.radioOptions)
                
                // MARK: Main
                SettingsSection(options: model.mainOptions)
                
                // MARK: Focus
                SettingsSection(options: model.focusOptions)
                
                // MARK: Authentication
                SettingsSection(options: model.authOptions)
                
                // MARK: Services
                SettingsSection(options: model.serviceOptions)
                
                // MARK: Input
                SettingsSection(options: model.inputOptions)
            }
            .searchable(text: $searchText, isPresented: $model.searchFocused, placement: .sidebar)
            .focused($isFocused)
            .opacity(appearsActive ? 1.0 : 0.5)
            .onAppear {
                isFocused = true
                if model.selectedOption == nil {
                    model.selectedOption = model.mainOptions.first
                }
            }
            .toolbar(removing: .sidebarToggle)
            .navigationSplitViewColumnWidth(215 + extraWidth)
        } detail: {
            NavigationStack(path: $model.path) {
                model.selectedOption?.destination
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    if model.internalBuild && model.showingTapToRadarButton {
                        Button("Tap-To-Radar", systemImage: "ant") {
                            if let url = URL(string: "tap-to-radar://new?ComponentID=219293&ComponentName=System%20Settings%20App&ComponentVersion=macOS&Title=&Description=&DeleteOnAttach=0&IncludeDevicePrefixInTitle=0") {
                                NSWorkspace.shared.open(url)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(SettingsViewModel())
        .frame(width: 715, height: 700)
}
