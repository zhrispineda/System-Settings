//
//  DisplaysView.swift
//  System Settings
//
//  System Settings > Displays
//

import SwiftUI

struct DisplaysView: View {
    var body: some View {
        CustomForm(title: "Displays") {
            Section {
                HStack(spacing: 40) {
                    Image(.resolution5)
                    Image(.resolution4)
                    Image(.resolution3)
                    Image(.resolution2)
                    Image(.resolution1)
                }
                .padding(.horizontal)
            } header: {
                Text("")
            }
        }
    }
}

#Preview {
    DisplaysView()
        .frame(width: 500, height: 700)
}
