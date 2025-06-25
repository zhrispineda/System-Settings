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

    init() {
        let bundleURL = URL(fileURLWithPath: "/System/Library/ExtensionKit/Extensions/GameCenterSettingsDeviceExpertExtension.appex")
        Localization.localizer = getLocalizable(bundleURL: bundleURL, stringsFile: "Localizable")
        Localization.preferredLocalizations = UserDefaults.standard.stringArray(forKey: "AppleLanguages") ?? []
    }

    var body: some View {
        CustomForm(title: "SETTINGS_DEEPLINK_EXT_SIGN_IN_PATH".localized()) {
            PlacardToggle(isOn: $gameCenterEnabled, icon: "com.apple.gamecenter.bubbles") {
                Text(localize: "SETTINGS_DEEPLINK_EXT_SIGN_IN_PATH")
                Text(.init("PLAYER_CARD_GAMECENTER_TOGGLE_OFF_FOOTER".localizedFormatted("[\("SETTINGS_PROFILE_PRIVACY_LINK_TEXT".localized())](systempreferences://)")))
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
