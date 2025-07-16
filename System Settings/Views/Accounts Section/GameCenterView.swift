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
    @State private var localization = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/GameCenterSettingsDeviceExpertExtension.appex")

    var body: some View {
        CustomForm(title: "SETTINGS_DEEPLINK_EXT_SIGN_IN_PATH".localized(using: localization)) {
            PlacardToggle(isOn: $gameCenterEnabled, icon: "com.apple.gamecenter.bubbles") {
                Text("SETTINGS_DEEPLINK_EXT_SIGN_IN_PATH".localized(using: localization))
                Text(.init("PLAYER_CARD_GAMECENTER_TOGGLE_OFF_FOOTER".localizedFormatted(using: localization, "[\("SETTINGS_PROFILE_PRIVACY_LINK_TEXT".localized(using: localization))](systempreferences://)")))
            }
        }
        .background {
            OnBoardingKitControllerView(bundleIdentifier: "com.apple.onboarding.gamecenter", showPopover: $showingPrivacy) {
                showingPrivacy = false
            }
            .opacity(0)
        }
        .onOpenURL { url in
            if url.scheme == "systempreferences" {
                showingPrivacy.toggle()
            }
        }
    }
}

#Preview {
    GameCenterView()
}
