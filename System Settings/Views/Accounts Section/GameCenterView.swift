//
//  GameCenterView.swift
//  System Settings
//
//  System Settings > Game Center
//

import SwiftUI

struct GameCenterView: View {
    @State private var gameCenterEnabled = false
    @State private var showingPrivacy = false

    var body: some View {
        CustomForm(title: "Game Center") {
            PlacardToggle(isOn: $gameCenterEnabled, icon: "com.apple.gamecenter.bubbles") {
                Text("Game Center")
                Text("A social gaming service that lets you interact with friends, track and compare scores and achievements, challenge other players, and compete in multiplayer games.")
                Button("See how your data is managed…") {
                    showingPrivacy.toggle()
                }
                .font(.callout)
                .foregroundColor(.blue)
                .buttonStyle(.plain)
            }
        }
        .background {
            OnBoardingKitControllerView(bundleIdentifier: "com.apple.onboarding.gamecenter", showPopover: $showingPrivacy) {
                showingPrivacy = false
            }
            .opacity(0)
        }
    }
}

#Preview {
    GameCenterView()
}
