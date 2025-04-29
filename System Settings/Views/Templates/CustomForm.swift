//
//  CustomForm.swift
//  System Settings
//

import SwiftUI

struct CustomForm<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content
    
    var body: some View {
        Form {
            content
        }
        .formStyle(.grouped)
        .navigationDestination(for: String.self) {_ in }
        .navigationTitle(title)
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
        ._safeAreaInsets(EdgeInsets(top: -19, leading: 0, bottom: 0, trailing: 0))
    }
}

#Preview {
    ContentView()
}
