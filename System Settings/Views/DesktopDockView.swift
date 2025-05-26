//
//  DesktopDockView.swift
//  System Settings
//
//  System Settings > Desktop & Dock
//

import SwiftUI

struct DesktopDockView: View {
    // Dock
    @State private var dockSize = 40.0
    @State private var dockMagnification = 0.0
    @State private var dockPosition = "Bottom"
    @State private var minimizeEffect = "Genie Effect"
    @State private var doubleClickAction = "Zoom"
    @State private var minimizeWindowIntoIcon = false
    @State private var autoHideDock = false
    @State private var animateAppOpen = true
    @State private var openAppIndicator = true
    @State private var suggestRecentApps = true
    // Desktop & Stage Manager
    @State private var showItemsDesktop = true
    @State private var showItemsStageManager = true
    @State private var clickWallpaperAction = "Only in Stage Manager"
    @State private var stageManagerEnabled = false
    @State private var stageManagerRecents = true
    @State private var stageManagerWindows = "All at Once"
    // Widgets
    @State private var showWidgetsDesktop = true
    @State private var showWidgetsStageManager = true
    @State private var widgetStyle = "Automatic"
    @State private var phoneWidgets = true
    @State private var defaultBrowser = "Safari"
    // Windows
    @State private var preferTabsDocs = "In Full Screen"
    @State private var askKeepChanges = false
    @State private var closeWindowsOnQuit = true
    @State private var dragWindowToTile = true
    @State private var dragWindowToFill = true
    @State private var holdKeyToTile = true
    @State private var tiledWindowsMargins = true
    // Mission Control
    @State private var autoRearrangeSpaces = true
    @State private var openWindowsSpaces = true
    @State private var groupWindowsByApps = false
    @State private var displaysSeparateSpaces = true
    @State private var dragWindowMissionControl = true
    let positionOptions = ["Left", "Bottom", "Right"]
    let effectOptions = ["Genie Effect", "Scale Effect"]
    let windowActions = ["Fill", "Zoom", "Minimize", "Do Nothing"]
    let clickWallpaperOptions = ["Always", "Only in Stage Manager"]
    let stageManagerWindowOptions = ["All at Once", "One at a Time"]
    let widgetStyleOptions = ["Automatic", "Monochrome", "Full-color"]
    let webBrowsers = ["Safari"]
    let openWithTabsOptions = ["Never", "Always", "In Full Screen"]
    
    var body: some View {
        CustomForm(title: "Desktop & Dock") {
            Section("Dock") {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Size")
                        Slider(value: $dockSize, in: 0...100, step: 50.0)
                            .labelsHidden()
                        HStack {
                            Text("Small")
                            Spacer()
                            Text("Large")
                        }
                        .font(.caption)
                    }
                    .frame(width: 215)
                    .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Magnification")
                        Slider(value: $dockMagnification, in: 0...100, step: 50.0)
                            .labelsHidden()
                        HStack {
                            Text("Off\tSmall")
                            Spacer()
                            Text("Large")
                        }
                        .font(.caption)
                    }
                    .frame(width: 200)
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
            
            Section("Widgets") {
                HStack {
                    Text("Show Widgets")
                    Spacer()
                    Toggle("On Desktop", isOn: $showWidgetsDesktop)
                        .toggleStyle(.checkbox)
                    Toggle("In Stage Manager", isOn: $showWidgetsStageManager)
                        .toggleStyle(.checkbox)
                }
                Picker("Widget style", selection: $widgetStyle) {
                    ForEach(widgetStyleOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                Toggle("Use iPhone widgets", isOn: $phoneWidgets)
            }
            
            Section {
                Picker("Default web browser", selection: $defaultBrowser) {
                    ForEach(webBrowsers, id: \.self) { option in
                        Text(option)
                    }
                }
            }
            
            Section("Windows") {
                Picker("Prefer tabs when opening documents", selection: $preferTabsDocs) {
                    ForEach(openWithTabsOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                Toggle("Ask to keep changes when closing documents", isOn: $askKeepChanges)
                Toggle(isOn: $closeWindowsOnQuit) {
                    Text("Close windows when quitting an application")
                    Text("When enabled, open documents and windows will not be restored when you re-open an application.")
                }
            }
            
            Section {
                Toggle("Drag windows to screen edges to tile", isOn: $dragWindowToTile)
                Toggle("Drag windows to menu bar to fill screen", isOn: $dragWindowToFill)
                Toggle("Hold ⌥ key while dragging windows to tile", isOn: $holdKeyToTile)
                Toggle("Tiled windows have margins", isOn: $tiledWindowsMargins)
            }
            
            Section {
                Toggle("Automatically rearrange Spaces based on most recent use", isOn: $autoRearrangeSpaces)
                Toggle("When switching to an application, switch to a Space with open windows for the application", isOn: $openWindowsSpaces)
                Toggle("Group windows by application", isOn: $groupWindowsByApps)
                Toggle("Displays have separate Spaces", isOn: $displaysSeparateSpaces)
                Toggle("Drag windows to top of screen to enter Mission Control", isOn: $dragWindowMissionControl)
            } header: {
                Text("Mission Control")
                Text("Mission Control shows an overview of your open windows and thumbnails of full-screen applications, all arranged in a unified view.")
            } footer: {
                Button("Shortcuts…") {}
                Button("Hot Corners…") {}
                HelpButton(topicID: "mchlp1119")
            }
        }
    }
}

#Preview {
    DesktopDockView()
        .frame(width: 500, height: 900)
}
