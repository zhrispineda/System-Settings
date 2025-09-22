//
//  StringExtensions.swift
//  System Settings
//

import SwiftUI

extension String {
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
