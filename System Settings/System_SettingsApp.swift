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
        Window("System Settings", id: "System Settings") {
            ContentView()
                .frame(width: 723)
                .frame(minHeight: 415, idealHeight: 574)
        }
        .windowResizability(.contentSize)
        .commands {
            CommandGroup(after: .help) {
                Button("macOS Help") {}
                Button("User Manual") {}
                Button("macOS Support") {}
                Divider()
                Button("MacBook Pro Specifications") {}
                Button("Hardware Support") {}
            }
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
