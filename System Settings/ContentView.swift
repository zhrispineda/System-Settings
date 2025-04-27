//
//  ContentView.swift
//  System Settings
//

import SwiftUI

struct ContentView: View {
    @State private var dividerOpacity = 0.0
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
                Section {
                    ForEach(radioOptions) { setting in
                        NavigationLink(value: setting) {
                            SettingsCell(setting.title, color: setting.color, symbol: setting.icon)
                                .overlay {
                                    if setting == radioOptions.first {
                                        DividerGeometryView(dividerOpacity: $dividerOpacity)
                                    }
                                }
                        }
                    }
                }
                
                Section {
                    ForEach(mainOptions) { setting in
                        NavigationLink(value: setting) {
                            SettingsCell(setting.title, color: setting.color, symbol: setting.icon)
                        }
                    }
                }
            }
            .overlay {
                Divider()
                    .frame(maxHeight: .infinity, alignment: .top)
                    .opacity(dividerOpacity)
            }
            .toolbar(removing: .sidebarToggle)
        } detail: {
            Form {
                selection?.destination
            }
            .formStyle(.grouped)
            ._safeAreaInsets(EdgeInsets(top: -18, leading: 0, bottom: 0, trailing: 0))
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

struct DividerGeometryView: View {
    @Binding var dividerOpacity: Double
    
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .onChange(of: geometry.frame(in: .scrollView).minY) {
                    dividerOpacity = (96.0 - geometry.frame(in: .scrollView).minY) / 4
                }
        }
    }
}

#Preview {
    ContentView()
        .frame(height: 500)
}
