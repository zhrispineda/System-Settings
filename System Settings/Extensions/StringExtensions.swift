//
//  StringExtensions.swift
//  System Settings
//

import SwiftUI

extension String {
    /// Returns a localized String given a table name and optional multi-argument values.
    ///
    /// ```swift
    /// var body: some View {
    ///      Text("KEY_TO_LOCALIZE".localize(table: "TableName")) // Table only
    ///      Text("KEY_TO_LOCALIZE".localize(table: "TableName", "VARIABLE")) // Table and a single variable
    ///      Toggle("KEY_TO_LOCALIZE".localize(table: "TableName"), isOn: .constant(true)) // Table only
    ///      Toggle("KEY_TO_LOCALIZE".localize(table: "TableName", "VARIABLE"), isOn: .constant(true)) // Table and a single variable
    ///      Toggle("KEY_TO_LOCALIZE".localize(table: "TableName", "FIRST_VARIALBE", "SECOND_VARIABLE", "THIRD_VARIABLE"), isOn: .constant(true)) // Table and several variables
    /// }
    /// ```
    ///
    /// - Parameter table: The String table name to use.
    /// - Parameter variables: The optional multi-parameter Strings to display as a variable or as variables.
    /// - Returns: The localized String using the provided table.
    func localize(table: String, _ variables: String...) -> String {
        let format = NSLocalizedString(self, tableName: table, comment: "")
        let localizedVariables = variables.map { String(localized: String.LocalizationValue($0), table: table) }
        
        return String(format: format, locale: .current, arguments: localizedVariables)
    }
    
    // MARK: - Experimental
    func localized(using localizer: NSObject?, preferredLocalizations: [String]) -> String {
        guard let localizer else { return self }
        return objcLocalized(localizer, preferredLocalizations: preferredLocalizations)
    }
    
    func localized(using manager: LocalizationManager) -> String {
        guard let localizer = manager.localizer else { return self }
        return objcLocalized(localizer, preferredLocalizations: manager.preferredLocalizations)
    }
    
    func localizedFormatted(using manager: LocalizationManager, _ args: CVarArg...) -> String {
        let localized = self.localized(using: manager)
        return String(format: localized, arguments: args)
    }
    
    private func objcLocalized(_ localizer: NSObject, preferredLocalizations: [String]) -> String {
        let selector = localizedStringSelector
        guard localizer.responds(to: selector),
              let methodIMP = localizer.method(for: selector) else {
            return self
        }
        typealias LocalizedStringFunc = @convention(c) (NSObject, Selector, NSString, NSArray) -> NSString
        let impl = unsafeBitCast(methodIMP, to: LocalizedStringFunc.self)
        let result = impl(localizer, selector, self as NSString, preferredLocalizations as NSArray) as String
        return result.isEmpty ? self : result
    }
    
    private var localizedStringSelector: Selector {
        NSSelectorFromString("localizedStringWithString:preferredLocalizations:")
    }
}

func getLocalizable(bundleURL: URL, stringsFile: String) -> NSObject? {
    guard let localizer = NSClassFromString("_LSStringLocalizer") else {
        return nil
    }
    
    let allocSel = NSSelectorFromString("alloc")
    guard let allocated = (localizer as AnyObject).perform(allocSel)?.takeUnretainedValue() as? NSObject else {
        return nil
    }
    
    let initSel = NSSelectorFromString("initWithBundleURL:stringsFile:")
    guard allocated.responds(to: initSel) else {
        return nil
    }
    
    let initialized = allocated.perform(initSel, with: bundleURL as NSURL, with: stringsFile as NSString)?.takeUnretainedValue() as? NSObject
    return initialized
}
