//
//  LocalizationManager.swift
//  System Settings
//

import SwiftUI

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
