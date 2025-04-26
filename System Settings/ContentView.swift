//
//  ContentView.swift
//  System Settings
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var selection: SettingsItem? = mainOptions.first

    var body: some View {
        NavigationSplitView {
            List {}
                .frame(height: 30)
                .scrollDisabled(true)
                .searchable(text: $searchText, placement: .sidebar)
                .navigationSplitViewColumnWidth(215)
            List(selection: $selection) {
                ForEach(mainOptions) { setting in
                    NavigationLink(value: setting) {
                        SettingsCell(setting.title, color: setting.color, symbol: setting.icon)
                    }
                }
            }
            .toolbar(removing: .sidebarToggle)
        } detail: {
            List {
                Form {
                    selection?.destination
                }
                .formStyle(.grouped)
                .listRowInsets(EdgeInsets(top: 0, leading: -15, bottom: 0, trailing: -15))

            }
            .navigationTitle(selection?.title ?? "")
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
