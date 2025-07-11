//
//  Placard.swift
//  System Settings
//

import SwiftUI

struct Placard<Content: View>: View {
    let icon: String
    @ViewBuilder let content: Content

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            TestIconView(icon: icon, size: 32)
                .padding(.top, -1)
                .padding(.leading, -2)
                .padding(.trailing, -6)
            LabeledContent {} label: {
                content
            }
        }
    }
}

#Preview {
    Placard(icon: "com.apple.graphic-icon.gear") {
        Text("Test")
        Text("Test")
    }
}
