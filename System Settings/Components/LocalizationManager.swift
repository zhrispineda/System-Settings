//
//  LocalizationManager.swift
//  System Settings
//

import SwiftUI

enum Localization {
    @MainActor static var localizer: NSObject?
    @MainActor static var preferredLocalizations: [String] = []

    @MainActor
    static func configure(bundleURL: URL) {
        self.localizer = getLocalizable(bundleURL: bundleURL, stringsFile: "Localizable")
        self.preferredLocalizations = UserDefaults.standard.stringArray(forKey: "AppleLanguages") ?? []
    }
}

@Observable class LocalizationManager {
    var bundleURL: URL {
        didSet { configure() }
    }
    var localizer: NSObject? = nil
    var preferredLocalizations: [String] = []
    
    init(bundleURL: URL) {
        self.bundleURL = bundleURL
        configure()
    }
    
    func configure() {
        localizer = getLocalizable(bundleURL: bundleURL, stringsFile: "Localizable")
        preferredLocalizations = UserDefaults.standard.stringArray(forKey: "AppleLanguages") ?? []
    }
}
