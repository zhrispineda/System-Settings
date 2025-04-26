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
        WindowGroup {
            ContentView()
                .frame(minHeight: 415)
                .task {
                    if let window = NSApp.windows.first {
                        window.titlebarAppearsTransparent = true
                    }
                }
        }
        .windowResizability(.contentSize)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
