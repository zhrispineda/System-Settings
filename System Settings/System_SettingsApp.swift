//
//  System_SettingsApp.swift
//  System Settings
//

import SwiftUI

@main
struct System_SettingsApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        NSSplitViewItem.swizzle()
        NSView.swizzle()
    }
    
    var body: some Scene {
        let infoTable = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/AboutExtension.appex", stringsFile: "SupportLinks")
        let macInfo = MacInfo()
        let deviceCode = MGHelper.read(key: "oYicEKzVTz4/CxxE05pEgQ")?.dropLast(3)
        let locale = Locale.current
        let spCode = macInfo.helpPage(deviceCode: String(deviceCode ?? ""))
        let languageCode = locale.language.languageCode?.identifier ?? "en"
        let regionCode = locale.region?.identifier ?? "US"
        let formattedLocale = "\(languageCode)-\(regionCode)_\(regionCode)"
        
        Window("System Settings", id: "System Settings") {
            ContentView()
                .frame(width: 723)
                .frame(minHeight: 415, idealHeight: 574)
        }
        .windowResizability(.contentSize)
        .commands {
            CommandGroup(after: .help) {
                Button("macOS Help") {
                    if let url = URL(string: "help:anchor=mh15217") {
                        NSWorkspace.shared.open(url)
                    }
                }
                Button("User Manual") {
                    let key = "URL_MAC_MANUAL".localizedFormatted(using: infoTable, spCode, formattedLocale)
                    if let url = URL(string: key) {
                        NSWorkspace.shared.open(url)
                    }
                }
                Button("macOS Support") {
                    let key = "URL_OSX_SUPPORT".localizedFormatted(using: infoTable, spCode, formattedLocale)
                    if let url = URL(string: key) {
                        NSWorkspace.shared.open(url)
                    }
                }
                
                Divider()
                
                Button("\(macInfo.model().name) Specifications") {
                    let key = "URL_MAC_SPECS".localizedFormatted(using: infoTable, spCode, formattedLocale)
                    if let url = URL(string: key) {
                        NSWorkspace.shared.open(url)
                    }
                }
                Button("Hardware Support") {
                    let key = "URL_MAC_SUPPORT".localizedFormatted(using: infoTable, spCode, formattedLocale)
                    if let url = URL(string: key) {
                        NSWorkspace.shared.open(url)
                    }
                }
            }
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
