//
//  ContentView.swift
//  System Settings
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var selection: SettingsOptions = .general

    var body: some View {
        NavigationSplitView {
            List {}
                .frame(height: 38)
                .scrollDisabled(true)
                .searchable(text: $searchText, placement: .sidebar)
                .navigationSplitViewColumnWidth(215)
            List(SettingsOptions.allCases, selection: $selection) { setting in
                NavigationLink(value: setting) {
                    SettingsCell(setting.rawValue, color: setting.color, symbol: setting.symbol)
                }
            }
            .toolbar(removing: .sidebarToggle)
            .toolbar {
               Color.clear
            }
        } detail: {
            List {
                Form {
                    selection.destination
                }
                .formStyle(.grouped)
                .listRowInsets(EdgeInsets(top: 0, leading: -15, bottom: 0, trailing: -15))

            }
            .navigationTitle(selection.rawValue)
            .scrollContentBackground(.hidden)
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

#Preview {
    ContentView()
}
