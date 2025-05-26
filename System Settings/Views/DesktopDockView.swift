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
    let table = "DesktopSettings"
    
    var body: some View {
        CustomForm(title: "Desktop & Dock") {
            Section("Dock".localize(table: table)) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Size", tableName: table)
                        Slider(value: $dockSize, in: 0...100, step: 50.0)
                            .labelsHidden()
                        HStack {
                            Text("Small", tableName: table)
                            Spacer()
                            Text("Large", tableName: table)
                        }
                        .font(.caption)
                    }
                    .frame(width: 215)
                    .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Magnification", tableName: table)
                        Slider(value: $dockMagnification, in: 0...100, step: 50.0)
                            .labelsHidden()
                        HStack {
                            Text("\("Off".localize(table: table))\t\("Small".localize(table: table))")
                            Spacer()
                            Text("Large", tableName: table)
                        }
                        .font(.caption)
                    }
                    .frame(width: 200)
                }
            }
            
            Section {
                Picker("Position on screen".localize(table: table), selection: $dockPosition) {
                    ForEach(positionOptions, id: \.self) { option in
                        Text(option.localize(table: table))
                    }
                }
                Picker("Minimize windows using".localize(table: table), selection: $minimizeEffect) {
                    ForEach(effectOptions, id: \.self) { option in
                        Text(option.localize(table: table))
                    }
                }
                Picker("Double-click a window’s title bar to".localize(table: table), selection: $doubleClickAction) {
                    ForEach(windowActions, id: \.self) { option in
                        if windowActions[windowActions.count - 2] == option {
                            Text(option.localize(table: table))
                            Divider()
                        } else {
                            Text(option.localize(table: table))
                        }
                    }
                }
                Toggle("Minimize windows into application icon".localize(table: table), isOn: $minimizeWindowIntoIcon)
            }
            
            Section {
                Toggle("Automatically hide and show the Dock".localize(table: table), isOn: $autoHideDock)
                Toggle("Animate opening applications".localize(table: table), isOn: $animateAppOpen)
                Toggle("Show indicators for open applications".localize(table: table), isOn: $openAppIndicator)
                Toggle("Show suggested and recent apps in Dock".localize(table: table), isOn: $suggestRecentApps)
            }
            
            Section("Desktop & Stage Manager".localize(table: table)) {
                HStack {
                    Text("Show Items", tableName: table)
                    Spacer()
                    Toggle("On Desktop".localize(table: table), isOn: $showItemsDesktop)
                        .toggleStyle(.checkbox)
                    Toggle("In Stage Manager".localize(table: table), isOn: $showItemsStageManager)
                        .toggleStyle(.checkbox)
                }
                Picker(selection: $clickWallpaperAction) {
                    ForEach(clickWallpaperOptions, id: \.self) { option in
                        Text(option.localize(table: table))
                    }
                } label: {
                    Text("Click wallpaper to reveal desktop", tableName: table)
                    Text("Clicking your wallpaper will move all windows out of the way to allow access to your desktop items and widgets.", tableName: table)
                }
            }
            
            Section {
                Toggle(isOn: $stageManagerEnabled) {
                    Text("Stage Manager", tableName: table)
                    Text("Stage Manager arranges your recent windows into a single strip for reduced clutter and quick access.", tableName: table)
                }
                Toggle("Show recent apps in Stage Manager".localize(table: table), isOn: $stageManagerRecents)
                Picker("Show windows from an application".localize(table: table), selection: $stageManagerWindows) {
                    ForEach(stageManagerWindowOptions, id: \.self) { option in
                        Text(option.localize(table: table))
                    }
                }
            }
            
            Section("Widgets".localize(table: table)) {
                HStack {
                    Text("Show Widgets", tableName: table)
                    Spacer()
                    Toggle("On Desktop".localize(table: table), isOn: $showWidgetsDesktop)
                        .toggleStyle(.checkbox)
                    Toggle("In Stage Manager".localize(table: table), isOn: $showWidgetsStageManager)
                        .toggleStyle(.checkbox)
                }
                Picker("Widget style".localize(table: table), selection: $widgetStyle) {
                    ForEach(widgetStyleOptions, id: \.self) { option in
                        Text(option.localize(table: table))
                    }
                }
                Toggle("Use iPhone widgets".localize(table: table), isOn: $phoneWidgets)
            }
            
            Section {
                Picker("Default web browser".localize(table: table), selection: $defaultBrowser) {
                    ForEach(webBrowsers, id: \.self) { option in
                        Text(option.localize(table: table))
                    }
                }
            }
            
            Section("Windows".localize(table: table)) {
                Picker("Prefer tabs when opening documents".localize(table: table), selection: $preferTabsDocs) {
                    ForEach(openWithTabsOptions, id: \.self) { option in
                        Text(option.localize(table: table))
                    }
                }
                Toggle("Ask to keep changes when closing documents".localize(table: table), isOn: $askKeepChanges)
                Toggle(isOn: $closeWindowsOnQuit) {
                    Text("Close windows when quitting an application", tableName: table)
                    Text("When enabled, open documents and windows will not be restored when you re-open an application.", tableName: table)
                }
            }
            
            Section {
                Toggle("Drag windows to screen edges to tile".localize(table: table), isOn: $dragWindowToTile)
                Toggle("Drag windows to menu bar to fill screen".localize(table: table), isOn: $dragWindowToFill)
                Toggle("Hold ⌥ key while dragging windows to tile".localize(table: table), isOn: $holdKeyToTile)
                Toggle("Tiled windows have margins".localize(table: table), isOn: $tiledWindowsMargins)
            }
            
            Section {
                Toggle("Automatically rearrange Spaces based on most recent use".localize(table: table), isOn: $autoRearrangeSpaces)
                Toggle("When switching to an application, switch to a Space with open windows for the application".localize(table: table), isOn: $openWindowsSpaces)
                Toggle("Group windows by application".localize(table: table), isOn: $groupWindowsByApps)
                Toggle("Displays have separate Spaces".localize(table: table), isOn: $displaysSeparateSpaces)
                Toggle("Drag windows to top of screen to enter Mission Control".localize(table: table), isOn: $dragWindowMissionControl)
            } header: {
                Text("Mission Control", tableName: table)
                Text("Mission Control shows an overview of your open windows and thumbnails of full-screen applications, all arranged in a unified view.", tableName: table)
            } footer: {
                Button("Shortcuts…".localize(table: table)) {}
                Button("Hot Corners…".localize(table: table)) {}
                HelpButton(topicID: "mchlp1119")
            }
        }
    }
}

#Preview {
    DesktopDockView()
        .frame(width: 500, height: 1700)
}
