//
//  NSImageExtensions.swift
//  System Settings
//

import SwiftUI

extension NSImage {
    static func asset(path: String, name: String) -> NSImage? {
        guard let bundle = Bundle(path: path) else {
            print("Could not load image '\(name)' from bundle: \(path)")
            return nil
        }
        return bundle.image(forResource: name)
    }
}
