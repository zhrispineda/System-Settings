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
        .contentMargins(.top, -21, for: .scrollContent)
        .formStyle(.grouped)
        .scrollEdgeEffectStyle(.hard, for: .top)
        .safeAreaBar(edge: .top) {
            Divider()
                .offset(y: -1)
        }
        .navigationDestination(for: String.self) {_ in }
        .navigationTitle(title)
        .navigationSplitViewColumnWidth(500)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                HStack {
                    Button("Back", systemImage: "chevron.left") {}
                        .disabled(true)
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
