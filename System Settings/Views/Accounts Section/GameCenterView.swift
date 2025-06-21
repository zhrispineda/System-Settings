//
//  GameCenterView.swift
//  System Settings
//
//  System Settings > Game Center
//

import SwiftUI

struct GameCenterView: View {
    @State private var gameCenterEnabled: Bool = false

    var body: some View {
        CustomForm(title: "Game Center") {
            PlacardToggle(isOn: $gameCenterEnabled, icon: "com.apple.gamecenter.bubbles") {
                Text("Game Center")
                Text("A social gaming service that lets you interact with friends, track and compare scores and achievements, challenge other players, and compete in multiplayer games.")
                Text("See how your data is managed…")
                    .foregroundStyle(.accent)
                    .font(.callout)
            }
        }
    }
}

#Preview {
    GameCenterView()
}
