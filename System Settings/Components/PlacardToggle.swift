//
//  PlacardToggle.swift
//  System Settings
//

import SwiftUI

/// A placard view that displays an icon and a large toggle alongside a title, subtitle, and learn more link.
struct PlacardToggle: View {
    @Binding var isOn: Bool
    let icon: String
    let title: Text
    let subtitle: Text
    var disabled = false

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            TestIconView(icon: icon, size: 32)
                .padding(.top, -1)
                .padding(.leading, -2)
                .padding(.trailing, -6)
            Toggle(isOn: $isOn) {
                title
                subtitle
                    .padding(.top, -0.5)
            }
            .controlSize(.large)
            .disabled(disabled)
        }
    }
}

#Preview {
    PlacardToggle(isOn: .constant(false), icon: "Icon", title: Text("Title"), subtitle: Text("Subtitle"))
}
