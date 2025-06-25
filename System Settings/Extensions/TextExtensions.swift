//
//  TextExtensions.swift
//  System Settings
//

import SwiftUI

extension Text {
    @MainActor init(localize key: String) {
        self.init(key.localized())
    }
}
