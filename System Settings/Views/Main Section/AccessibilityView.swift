//
//  AccessibilityView.swift
//  System Settings
//
//  System Settings > Accessibility
//

import SwiftUI

struct AccessibilityView: View {
    var body: some View {
        CustomForm(title: "Accessibility") {
            Section {
                HStack(alignment: .top, spacing: 15) {
                    IconView("accessibility", color: .blue)
                        .scaleEffect(1.3)
                        .padding(.top, 2)
                    VStack(alignment: .leading) {
                        Text("Accessibility")
                        Text("\("Personalize Mac in ways that work best for you with accessibility features for vision, hearing, motor, speech, and cognition.") [\("Learn More…")](help:anchor=mh35884)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .offset(y: -6)
                }
                .padding([.leading, .top, .trailing], 6)
                .padding(.bottom, -6)
            }
            
            Section("Vision") {
                NavigationLink(value: "VoiceOver") {
                    SettingsCell("VoiceOver", symbol: "com.apple.graphic-icon.voice-over")
                }
                NavigationLink(value: "Zoom") {
                    SettingsCell("Zoom", symbol: "com.apple.AccessibilityUIServer.zoom")
                }
                NavigationLink(value: "Hover Text") {
                    SettingsCell("Hover Text", symbol: "com.apple.AccessibilityUIServer.hovertext")
                }
                NavigationLink(value: "Display") {
                    SettingsCell("Display", symbol: "com.apple.accessibility-settings.icon.display")
                }
                NavigationLink(value: "Motion") {
                    SettingsCell("Motion", symbol: "com.apple.graphic-icon.motion")
                }
                NavigationLink(value: "Read & Speak") {
                    SettingsCell("Read & Speak", symbol: "com.apple.graphic-icon.spoken-content")
                }
                NavigationLink(value: "Audio Descriptions") {
                    SettingsCell("Audio Descriptions", symbol: "com.apple.AccessibilityUIServer.audio.descriptions")
                }
            }
            
            Section("Hearing") {
                NavigationLink(value: "Hearing Devices") {
                    SettingsCell("Hearing Devices", symbol: "com.apple.graphic-icon.hearing")
                }
                NavigationLink(value: "Audio") {
                    SettingsCell("Audio", symbol: "com.apple.graphic-icon.sound")
                }
                NavigationLink(value: "RTT") {
                    SettingsCell("RTT", symbol: "com.apple.graphic-icon.tty")
                }
                NavigationLink(value: "Captions") {
                    SettingsCell("Captions", symbol: "com.apple.graphic-icon.subtitles-and-captioning")
                }
                NavigationLink(value: "Live Captions") {
                    SettingsCell("Live Captions", symbol: "com.apple.AccessibilityUIServer.live.captions")
                }
                NavigationLink(value: "Name Recognition") {
                    SettingsCell("Name Recognition", symbol: "com.apple.accessibility-settings.icon.namerecognition")
                }
            }
            
            Section("Motor") {
                NavigationLink(value: "Voice Control") {
                    SettingsCell("Voice Control", symbol: "com.apple.AccessibilityUIServer.voice.control")
                }
                NavigationLink(value: "Keyboard") {
                    SettingsCell("Keyboard", symbol: "com.apple.graphic-icon.keyboard")
                }
                NavigationLink(value: "Pointer Control") {
                    SettingsCell("Pointer Control", symbol: "com.apple.accessibility-settings.icon.pointercontrol")
                }
                NavigationLink(value: "Switch Control") {
                    SettingsCell("Switch Control", symbol: "com.apple.accessibility-settings.icon.switchcontrol")
                }
            }
            
            Section("Speech") {
                NavigationLink(value: "Live Speech") {
                    SettingsCell("Live Speech", symbol: "com.apple.accessibility-settings.icon.livespeech")
                }
                NavigationLink(value: "Personal Voice") {
                    SettingsCell("Personal Voice", symbol: "com.apple.AccessibilityUIServer.personal.voice")
                }
                NavigationLink(value: "Vocal Shortcuts") {
                    SettingsCell("Vocal Shortcuts", symbol: "com.apple.AccessibilityUIServer.vocal.shortcuts")
                }
            }
            
            Section {
                NavigationLink(value: "Siri") {
                    SettingsCell("Siri", symbol: "com.apple.application-icon.siri")
                }
                NavigationLink(value: "Shortcut") {
                    SettingsCell("Shortcut", symbol: "com.apple.accessibility-settings.icon.shortcut")
                }
            } header: {
                Text("General")
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
