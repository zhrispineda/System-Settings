//
//  SwizzledExtensions.swift
//  System Settings
//

import SwiftUI

// Disables functionality related to collapsing and re-sizing the sidebar
extension NSSplitViewItem {
    @objc private var canCollapseSwizzled: Bool { false }

    static func swizzle() {
        guard
            let original = class_getInstanceMethod(self, #selector(getter: NSSplitViewItem.canCollapse)),
            let swizzled = class_getInstanceMethod(self, #selector(getter: canCollapseSwizzled))
        else { return }
        method_exchangeImplementations(original, swizzled)
    }
}

// Disables right-click menus (temporary)
extension NSView {
    @objc func rightMouseDownSwizzled(with event: NSEvent) {}

    static func swizzle() {
        guard
            let original = class_getInstanceMethod(self, #selector(self.rightMouseDown(with:))),
            let swizzled = class_getInstanceMethod(self, #selector(self.rightMouseDownSwizzled(with:)))
        else { return }
        method_exchangeImplementations(original, swizzled)
    }
}
