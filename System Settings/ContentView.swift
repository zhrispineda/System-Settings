//
//  ContentView.swift
//  System Settings
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""

    var body: some View {
        NavigationSplitView {
            List {}
                .frame(height: 38)
                .scrollDisabled(true)
                .searchable(text: $searchText, placement: .sidebar)
                .navigationSplitViewColumnWidth(215)
            List {
                
            }
            .toolbar(removing: .sidebarToggle)
            .toolbar {
               Color.clear
            }
        } detail: {
            List {
                
            }
            .navigationTitle("")
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
