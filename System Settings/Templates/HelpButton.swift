//
//  HelpButton.swift
//  System Settings
//

import SwiftUI

struct HelpButton: View {
    let topicID: String
    
    var body: some View {
        Button {
            if let url = URL(string: "help:anchor=\(topicID)") {
                NSWorkspace.shared.open(url)
            }
        } label: {
            Image(systemName: "questionmark.circle.fill")
                .fontWeight(.regular)
                .foregroundStyle(.primary, Color(NSColor.controlColor))
                .imageScale(.large)
                .shadow(radius: 0.5)
        }
        .buttonStyle(.plain)
        .scaleEffect(1.2)
    }
}

#Preview {
    HelpButton(topicID: "")
}
