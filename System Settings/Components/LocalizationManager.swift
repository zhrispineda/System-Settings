//
//  LocalizationManager.swift
//  System Settings
//

import SwiftUI

/// A manager class responsible for configuring and providing localization.
///
/// - Parameters:
///   - bundleURL: The file-system path (as String) to a bundle or framework.
///   - stringsFile: The name of the `.strings` file to use (default: "Localizable").
///
/// LocalizationManager is used to initialize localization based on the user's language. The language is obtained from the UserDefaults key `AppleLanguages`.
///
/// It will first configure itself to the given bundleURL path and set stringsFile name. It then calls   `getLocalizable(bundleURL:stringsFile:)`, calling upon `_LSStringLocalizer` to obtain string keys located in either the language's `.lproj` folder or `.loctable` dictionary.
///
/// - Note: If the specified `bundleURL` or `stringsFile` parameters are not valid, the text will default to its original unmodified string.
class LocalizationManager {
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
        preferredLocalizations = Locale.preferredLanguages
    }
}
