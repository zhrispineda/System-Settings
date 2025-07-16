//
//  LocalizationManager.swift
//  System Settings
//

import SwiftUI

@Observable class LocalizationManager {
    var bundleURL: String {
        didSet { configure(stringsFile: stringsFile) }
    }
    var localizer: NSObject? = nil
    var preferredLocalizations: [String] = []
    var stringsFile: String
    
    init(bundleURL: String, stringsFile: String = "Localizable") {
        self.bundleURL = bundleURL
        self.stringsFile = stringsFile
        configure(stringsFile: stringsFile)
    }
    
    func configure(stringsFile: String = "Localizable") {
        localizer = getLocalizable(bundleURL: URL(filePath: bundleURL), stringsFile: stringsFile)
        preferredLocalizations = UserDefaults.standard.stringArray(forKey: "AppleLanguages") ?? []
    }
}
