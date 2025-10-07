//
//  AppleAccountCell.swift
//  System Settings
//

import SwiftUI

/// The top sidebar section for Apple Account. Shown as signed out.
///
/// Based on `com.apple.systempreferences.AppleIDSettings` from path: `/System/Library/ExtensionKit/Extensions/AppleIDSettings.appex`
struct AppleAccountCell: View {
    let localization = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/AppleIDSettings.appex")
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 32))
                .foregroundStyle(.white, Color(NSColor.lightGray))
                .padding(.horizontal, -3)
            VStack(alignment: .leading) {
                /// en: Sign in
                Text("SPYGLASS_TITLE_SIGN_IN".localized(using: localization))
                    .fontWeight(.semibold)
                /// en: with your Apple Account
                Text("SPYGLASS_DESCRIPTION_SIGN_IN_REBRAND".localized(using: localization))
                    .lineLimit(2)
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    ContentView()
        .frame(width: 715, height: 700)
}
