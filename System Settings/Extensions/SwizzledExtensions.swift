//
//  SwizzledExtensions.swift
//  System Settings
//

import SwiftUI

extension NSSplitViewItem {
    @objc fileprivate var canCollapseSwizzled: Bool {
        return false
    }

    static func swizzle() {
        let canCollapse = #selector(getter: NSSplitViewItem.canCollapse)
        let swizzledSelector = #selector(getter: canCollapseSwizzled)
        
        if let originalMethod = class_getInstanceMethod(self as AnyClass, canCollapse),
           let swizzledMethod = class_getInstanceMethod(self as AnyClass, swizzledSelector) {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}

extension NSView {
    @objc func rightMouseDownSwizzled(with event: NSEvent) {}

    static func swizzle() {
        let rightMouseDown = #selector(NSView.rightMouseDown(with:))
        let swizzledSelector = #selector(NSView.rightMouseDownSwizzled(with:))

        if let originalMethod = class_getInstanceMethod(self as AnyClass, rightMouseDown),
           let swizzledMethod = class_getInstanceMethod(self as AnyClass, swizzledSelector) {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}
