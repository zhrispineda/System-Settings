//
//  AccessibilityView.swift
//  System Settings
//
//  System Settings > Accessibility
//

import SwiftUI

struct AccessibilityView: View {
    let featureLocalization = LocalizationManager(bundleURL: "/System/Library/PrivateFrameworks/AccessibilitySettingsUI.framework", stringsFile: "AccessibilitySettingsUI")
    let titleLocalization = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/AccessibilitySettingsExtension.appex",
        stringsFile: "InfoPlist"
    )
    let localization = LocalizationManager(
        bundleURL: "/System/Library/ExtensionKit/Extensions/AccessibilitySettingsExtension.appex"
    )
    
    var body: some View {
        CustomForm(title: "CFBundleName".localized(using: titleLocalization)) {
            Section {
                Placard(icon: "com.apple.graphic-icon.accessibility") {
                    Text("CFBundleName".localized(using: titleLocalization))
                    Text("\("accessibilityPlacardInfo".localized(using: localization)) [\("global.link.learnMore".localized(using: localization))](help:anchor=mh35884)")
                        .padding(.top, -0.5)
                }
            }
            
            Section("category.seeing.title".localized(using: localization)) {
                NavigationLink(value: "VoiceOver") {
                    SettingsCell("voiceOver.toggle".localized(using: localization), symbol: "com.apple.graphic-icon.voice-over")
                }
                NavigationLink(value: "Zoom") {
                    SettingsCell("GUEST_PASS_FEATURE_ZOOM".localized(using: featureLocalization), symbol: "com.apple.AccessibilityUIServer.zoom")
                }
                NavigationLink(value: "Hover Text") {
                    SettingsCell("zoom.enableHoverTyping".localized(using: localization), symbol: "com.apple.AccessibilityUIServer.hovertext")
                }
                NavigationLink(value: "Display") {
                    SettingsCell("Display", symbol: "com.apple.accessibility-settings.icon.display")
                }
                NavigationLink(value: "Motion") {
                    SettingsCell("GUEST_PASS_FEATURE_MOTION".localized(using: featureLocalization), symbol: "com.apple.graphic-icon.motion")
                }
                NavigationLink(value: "Read & Speak") {
                    SettingsCell("GUEST_PASS_FEATURE_SPOKEN_CONTENT".localized(using: featureLocalization), symbol: "com.apple.graphic-icon.spoken-content")
                }
                NavigationLink(value: "Audio Descriptions") {
                    SettingsCell("Audio Descriptions", symbol: "com.apple.AccessibilityUIServer.audio.descriptions")
                }
            }
            
            Section("category.hearing.title".localized(using: localization)) {
                NavigationLink(value: "Hearing Devices") {
                    SettingsCell("Hearing Devices", symbol: "com.apple.graphic-icon.hearing")
                }
                NavigationLink(value: "Audio") {
                    SettingsCell("switch.triggerType.audio.displayName".localized(using: localization), symbol: "com.apple.graphic-icon.sound")
                }
                NavigationLink(value: "RTT") {
                    SettingsCell("rtt.enableRtt".localized(using: localization), symbol: "com.apple.graphic-icon.tty")
                }
                NavigationLink(value: "Captions") {
                    SettingsCell("Captions", symbol: "com.apple.graphic-icon.subtitles-and-captioning")
                }
                NavigationLink(value: "Live Captions") {
                    SettingsCell("systemTranscription.toggle".localized(using: localization), symbol: "com.apple.AccessibilityUIServer.live.captions")
                }
                NavigationLink(value: "Name Recognition") {
                    SettingsCell("nameRecognition.title".localized(using: localization), symbol: "com.apple.accessibility-settings.icon.namerecognition")
                }
            }
            
            Section("category.interacting.title".localized(using: localization)) {
                NavigationLink(value: "Voice Control") {
                    SettingsCell("voiceControl.toggle".localized(using: localization), symbol: "com.apple.AccessibilityUIServer.voice.control")
                }
                NavigationLink(value: "Keyboard") {
                    SettingsCell("switch.triggerType.keyboard.displayName".localized(using: localization), symbol: "com.apple.graphic-icon.keyboard")
                }
                NavigationLink(value: "Pointer Control") {
                    SettingsCell("GUEST_PASS_FEATURE_POINTER_CONTROL".localized(using: featureLocalization), symbol: "com.apple.accessibility-settings.icon.pointercontrol")
                }
                NavigationLink(value: "Switch Control") {
                    SettingsCell("switchControl.toggle".localized(using: localization), symbol: "com.apple.accessibility-settings.icon.switchcontrol")
                }
            }
            
            Section("category.speech.title".localized(using: localization)) {
                NavigationLink(value: "Live Speech") {
                    SettingsCell("liveSpeech.toggle".localized(using: localization), symbol: "com.apple.accessibility-settings.icon.livespeech")
                }
                NavigationLink(value: "Personal Voice") {
                    SettingsCell("personalVoice.title".localized(using: localization), symbol: "com.apple.AccessibilityUIServer.personal.voice")
                }
                NavigationLink(value: "Vocal Shortcuts") {
                    SettingsCell("avs.title".localized(using: localization), symbol: "com.apple.AccessibilityUIServer.vocal.shortcuts")
                }
            }
            
            Section {
                NavigationLink(value: "Siri") {
                    SettingsCell("Siri", symbol: "com.apple.application-icon.siri")
                }
                NavigationLink(value: "Shortcut") {
                    SettingsCell(
                        "switch.triggerType.combo.displayName".localized(using: localization),
                        symbol: "com.apple.accessibility-settings.icon.shortcut"
                    )
                }
            } header: {
                Text("global.general".localized(using: localization))
            } footer: {
                HelpButton(topicID: "mchlp1400")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AccessibilityView()
            .frame(height: 700)
    }
}
