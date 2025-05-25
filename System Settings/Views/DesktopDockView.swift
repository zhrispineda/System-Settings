//
//  DesktopDockView.swift
//  System Settings
//
//  System Settings > Desktop & Dock
//

import SwiftUI

struct DesktopDockView: View {
    @State private var dockPosition = "Bottom"
    @State private var minimizeEffect = "Genie Effect"
    @State private var doubleClickAction = "Zoom"
    @State private var minimizeWindowIntoIcon = false
    @State private var autoHideDock = false
    @State private var animateAppOpen = true
    @State private var openAppIndicator = true
    @State private var suggestRecentApps = true
    @State private var showItemsDesktop = true
    @State private var showItemsStageManager = true
    @State private var clickWallpaperAction = "Only in Stage Manager"
    @State private var stageManagerEnabled = false
    @State private var stageManagerRecents = true
    @State private var stageManagerWindows = "All at Once"
    let positionOptions = ["Left", "Bottom", "Right"]
    let effectOptions = ["Genie Effect", "Scale Effect"]
    let windowActions = ["Fill", "Zoom", "Minimize", "Do Nothing"]
    let clickWallpaperOptions = ["Always", "Only in Stage Manager"]
    let stageManagerWindowOptions = ["All at Once", "One at a Time"]
    
    var body: some View {
        CustomForm(title: "Desktop & Dock") {
            Section("Dock") {
                HStack {
                    Text("Size")
                        .frame(width: 215, alignment: .leading)
                    Text("Magnification")
                        .frame(width: 200, alignment: .leading)
                }
            }
            
            Section {
                Picker("Position on screen", selection: $dockPosition) {
                    ForEach(positionOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                Picker("Minimize windows using", selection: $minimizeEffect) {
                    ForEach(effectOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                Picker("Double-click a window's title bar to", selection: $doubleClickAction) {
                    ForEach(windowActions, id: \.self) { option in
                        if windowActions[windowActions.count - 2] == option {
                            Text(option)
                            Divider()
                        } else {
                            Text(option)
                        }
                    }
                }
                Toggle("Minimize windows into application icon", isOn: $minimizeWindowIntoIcon)
            }
            
            Section {
                Toggle("Automatically hide and show the Dock", isOn: $autoHideDock)
                Toggle("Animate opening applications", isOn: $animateAppOpen)
                Toggle("Show indicators for open applications", isOn: $openAppIndicator)
                Toggle("Show suggested and recent apps in Dock", isOn: $suggestRecentApps)
            }
            
            Section("Desktop & Stage Manager") {
                HStack {
                    Text("Show Items")
                    Spacer()
                    Toggle("On Desktop", isOn: $showItemsDesktop)
                        .toggleStyle(.checkbox)
                    Toggle("In Stage Manager", isOn: $showItemsStageManager)
                        .toggleStyle(.checkbox)
                }
                Picker(selection: $clickWallpaperAction) {
                    ForEach(clickWallpaperOptions, id: \.self) { option in
                        Text(option)
                    }
                } label: {
                    Text("Click wallpaper to reveal desktop")
                    Text("Clicking your wallpaper will move all windows out of the way to allow access to your desktop items and widgets.")
                }
            }
            
            Section {
                Toggle(isOn: $stageManagerEnabled) {
                    Text("Stage Manager")
                    Text("Stage Manager arranges your recent windows into a single strip for reduced clutter and quick access.")
                }
                Toggle("Show recent apps in Stage Manager", isOn: $stageManagerRecents)
                Picker("Show windows from an application", selection: $stageManagerWindows) {
                    ForEach(stageManagerWindowOptions, id: \.self) { option in
                        Text(option)
                    }
                }
            }
        }
    }
}

#Preview {
    DesktopDockView()
        .frame(width: 500, height: 800)
}
