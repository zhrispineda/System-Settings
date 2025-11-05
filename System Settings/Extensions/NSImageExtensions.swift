//
//  NSImageExtensions.swift
//  System Settings
//

import SwiftUI

extension NSImage {
    static func asset(path: String, name: String) -> NSImage? {
        guard let bundle = Bundle(path: path) else {
            return nil
        }
        return bundle.image(forResource: name)
    }
}
