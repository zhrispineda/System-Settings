//
//  CustomForm.swift
//  System Settings
//

import SwiftUI

struct CustomForm<Content: View>: View {
    @Environment(SettingsViewModel.self) private var model
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

#Preview {
    ContentView()
        .frame(width: 725, height: 600)
}
