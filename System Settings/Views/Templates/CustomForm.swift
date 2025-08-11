//
//  CustomForm.swift
//  System Settings
//

import SwiftUI

struct CustomForm<Content: View>: View {
    let title: String
    var root = true
    @ViewBuilder let content: Content
    
    var body: some View {
        Form {
            content
        }
        .scrollEdgeEffectStyle(.soft, for: .all)
        .contentMargins(.top, -20, for: .scrollContent)
        .formStyle(.grouped)
        .navigationDestination(for: String.self) {_ in }
        .navigationTitle(title)
        .navigationSplitViewColumnWidth(500)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                HStack {
                    if root {
                        Button("Back", systemImage: "chevron.left") {}
                            .disabled(true)
                    }
                    Button("Forward", systemImage: "chevron.right") {}
                        .disabled(true)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .frame(width: 725, height: 600)
}
