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
            Image(systemName: "questionmark")
                .foregroundStyle(Color.accentColor)
        }
        .clipShape(Circle())
    }
}

#Preview {
    HelpButton(topicID: "")
}
