//
//  AppleAccountCell.swift
//  System Settings
//

import SwiftUI

struct AppleAccountCell: View {
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 32))
                .foregroundStyle(.white, Color(NSColor.lightGray))
                .padding(.horizontal, -3)
            VStack(alignment: .leading) {
                Text("Sign in")
                    .fontWeight(.semibold)
                Text("with your Apple Account")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
