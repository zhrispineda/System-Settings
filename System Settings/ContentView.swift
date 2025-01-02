//
//  ContentView.swift
//  System Settings
//

import SwiftUI

struct ContentView: View {
    // Variables
    @State private var searchText = String()
    
    var body: some View {
        NavigationView {
            HStack {
                VStack(spacing: 0) {
                    List {
                        // Empty
                    }
                    .searchable(text: $searchText, placement: .sidebar)
                    .frame(height: 35)
                    Divider()
                    List {
                        
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                HStack {
                    Button("Back", systemImage: "chevron.backward") {}.disabled(true)
                    Button("Forward", systemImage: "chevron.forward") {}.disabled(true)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
