//
//  PlacardToggle.swift
//  System Settings
//

import SwiftUI

/// A placard view that displays an icon and a large toggle alongside a title, subtitle, and learn more link.
struct PlacardToggle<Content: View>: View {
    @Binding var isOn: Bool
    let icon: String
    @ViewBuilder let content: Content

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            IconView(icon: icon, size: 32)
                .padding(.top, -1)
                .padding(.leading, -2)
                .padding(.trailing, -6)
            Toggle(isOn: $isOn) {
                content
            }
            .controlSize(.large)
        }
    }
}

#Preview {
    PlacardToggle(isOn: .constant(false), icon: "Icon") {
        Text("Title")
        Text("Subtitle")
    }
    .frame(width: 200, height: 100)
}
