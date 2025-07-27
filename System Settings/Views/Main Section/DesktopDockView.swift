//
//  DesktopDockView.swift
//  System Settings
//
//  System Settings > Desktop & Dock
//

import SwiftUI

struct DesktopDockView: View {
    @State private var localization = LocalizationManager(bundleURL:  "/System/Library/ExtensionKit/Extensions/DesktopSettings.appex")
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
    @State private var clickWallpaperAction = "Only in Stage Manager on Click"
    @State private var stageManagerEnabled = false
    @State private var stageManagerRecents = true
    @State private var stageManagerWindows = "All at Once"
    // Widgets
    @State private var showWidgetsDesktop = true
    @State private var showWidgetsStageManager = true
    @State private var widgetStyle = "Automatically"
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
    let windowActions = ["Fill", "Zoom", "Minimize", "No Action"]
    let clickWallpaperOptions = ["Always on Wallpaper Click", "Only in Stage Manager on Click"]
    let stageManagerWindowOptions = ["All at Once", "One at a Time"]
    let widgetStyleOptions = ["Automatically", "Always", "Never"]
    let webBrowsers = ["Safari"]
    let openWithTabsOptions = ["Never", "Always", "In Full Screen"]
    
    var body: some View {
        CustomForm(title: "Desktop & Dock") {
            Section("Dock".localized(using: localization)) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Size".localized(using: localization))
                        Slider(value: $dockSize, in: 0...100, step: 50.0)
                            .labelsHidden()
                        HStack {
                            Text("Small".localized(using: localization))
                            Spacer()
                            Text("Large".localized(using: localization))
                        }
                        .font(.caption)
                    }
                    .frame(width: 215)
                    .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Magnification".localized(using: localization))
                        Slider(value: $dockMagnification, in: 0...100, step: 50.0)
                            .labelsHidden()
                        HStack {
                            Text("\("Off".localized(using: localization))\t\("Small".localized(using: localization))")
                            Spacer()
                            Text("Large".localized(using: localization))
                        }
                        .font(.caption)
                    }
                    .frame(width: 200)
                }
            }
            
            Section {
                Picker("Dock position on screen".localized(using: localization), selection: $dockPosition) {
                    ForEach(positionOptions, id: \.self) { option in
                        Text(option.localized(using: localization))
                    }
                }
                Picker("Minimized window animation".localized(using: localization), selection: $minimizeEffect) {
                    ForEach(effectOptions, id: \.self) { option in
                        Text(option.localized(using: localization))
                    }
                }
                Picker("Window title bar double-click action".localized(using: localization), selection: $doubleClickAction) {
                    ForEach(windowActions, id: \.self) { option in
                        if windowActions[windowActions.count - 2] == option {
                            Text(option.localized(using: localization))
                            Divider()
                        } else {
                            Text(option.localized(using: localization))
                        }
                    }
                }
                Toggle("Minimize windows into application icon".localized(using: localization), isOn: $minimizeWindowIntoIcon)
            }
            
            Section {
                Toggle("Automatically hide and show the Dock".localized(using: localization), isOn: $autoHideDock)
                Toggle("Animate opening applications".localized(using: localization), isOn: $animateAppOpen)
                Toggle("Show indicators for open applications".localized(using: localization), isOn: $openAppIndicator)
                Toggle("Show suggested and recent apps in Dock".localized(using: localization), isOn: $suggestRecentApps)
            }
            
            Section("Desktop & Stage Manager".localized(using: localization)) {
                HStack {
                    Text("Show Items".localized(using: localization))
                    Spacer()
                    Toggle("On Desktop".localized(using: localization), isOn: $showItemsDesktop)
                        .toggleStyle(.checkbox)
                    Toggle("In Stage Manager".localized(using: localization), isOn: $showItemsStageManager)
                        .toggleStyle(.checkbox)
                }
                Picker(selection: $clickWallpaperAction) {
                    ForEach(clickWallpaperOptions, id: \.self) { option in
                        Text(option.localized(using: localization))
                    }
                } label: {
                    Text("Show Desktop".localized(using: localization))
                    Text("Click wallpaper to move windows out of the way, revealing your desktop items and widgets.".localized(using: localization))
                }
            }
            
            Section {
                Toggle(isOn: $stageManagerEnabled) {
                    Text("Stage Manager".localized(using: localization))
                    Text("Stage Manager arranges your recent windows into a single strip for reduced clutter and quick access.".localized(using: localization))
                }
                Toggle("Show recent apps in Stage Manager".localized(using: localization), isOn: $stageManagerRecents)
                Picker("Show windows from an application".localized(using: localization), selection: $stageManagerWindows) {
                    ForEach(stageManagerWindowOptions, id: \.self) { option in
                        Text(option.localized(using: localization))
                    }
                }
            }
            
            Section("Widgets".localized(using: localization)) {
                HStack {
                    Text("Show Widgets".localized(using: localization))
                    Spacer()
                    Toggle("On Desktop".localized(using: localization), isOn: $showWidgetsDesktop)
                        .toggleStyle(.checkbox)
                    Toggle("In Stage Manager".localized(using: localization), isOn: $showWidgetsStageManager)
                        .toggleStyle(.checkbox)
                }
                Picker("Dim widgets on desktop".localized(using: localization), selection: $widgetStyle) {
                    ForEach(widgetStyleOptions, id: \.self) { option in
                        Text(option.localized(using: localization))
                    }
                }
                Toggle("iPhone Widgets".localized(using: localization), isOn: $phoneWidgets)
            }
            
            Section {
                Picker("Default web browser".localized(using: localization), selection: $defaultBrowser) {
                    ForEach(webBrowsers, id: \.self) { option in
                        Text(option.localized(using: localization))
                    }
                }
            }
            
            Section("Windows".localized(using: localization)) {
                Picker("Prefer tabs when opening documents".localized(using: localization), selection: $preferTabsDocs) {
                    ForEach(openWithTabsOptions, id: \.self) { option in
                        Text(option.localized(using: localization))
                    }
                }
                Toggle("Ask to keep changes when closing documents".localized(using: localization), isOn: $askKeepChanges)
                Toggle(isOn: $closeWindowsOnQuit) {
                    Text("Close windows when quitting an application".localized(using: localization))
                    Text("When enabled, open documents and windows will not be restored when you re-open an application.".localized(using: localization))
                }
            }

            Section {
                Toggle("Drag windows to left or right edge of screen to tile".localized(using: localization), isOn: $dragWindowToTile)
                Toggle("Drag windows to menu bar to fill screen".localized(using: localization), isOn: $dragWindowToFill)
                Toggle("Hold ⌥ key while dragging windows to tile".localized(using: localization), isOn: $holdKeyToTile)
                Toggle("Tiled windows have margins".localized(using: localization), isOn: $tiledWindowsMargins)
            }
            
            Section {
                Toggle("Automatically rearrange Spaces based on most recent use".localized(using: localization), isOn: $autoRearrangeSpaces)
                Toggle("When switching to an application, switch to a Space with open windows for the application".localized(using: localization), isOn: $openWindowsSpaces)
                Toggle("Group windows by application".localized(using: localization), isOn: $groupWindowsByApps)
                Toggle("Displays have separate Spaces".localized(using: localization), isOn: $displaysSeparateSpaces)
                Toggle("Drag windows to top of screen to enter Mission Control".localized(using: localization), isOn: $dragWindowMissionControl)
            } header: {
                Text("Mission Control".localized(using: localization))
                Text("Mission Control shows an overview of your open windows and thumbnails of full-screen applications, all arranged in a unified view.".localized(using: localization))
            } footer: {
                HStack {
                    Button("Shortcuts…".localized(using: localization)) {}
                    Button("Hot Corners…".localized(using: localization)) {}
                    HelpButton(topicID: "mchlp1119")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    DesktopDockView()
        .frame(width: 500, height: 1650)
}
