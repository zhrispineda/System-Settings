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
                    SettingsCell("VoiceOver", color: .black, symbol: "voiceover")
                }
                NavigationLink(value: "Zoom") {
                    SettingsCell("Zoom", color: .black, symbol: "arrowtriangles.up.right.down.left.magnifyingglass")
                }
                NavigationLink(value: "Hover Text") {
                    SettingsCell("Hover Text", color: .blue, symbol: "character.magnify")
                }
                NavigationLink(value: "Display") {
                    SettingsCell("Display", color: .blue, symbol: "display")
                }
                NavigationLink(value: "Spoken Content") {
                    SettingsCell("Spoken Content", color: .black, symbol: "rectangle.3.group.bubble.fill")
                }
                NavigationLink(value: "Audio Descriptions") {
                    SettingsCell("Audio Descriptions", color: .black, symbol: "quote.bubble.fill")
                }
            }
            
            Section("Hearing") {
                NavigationLink(value: "Hearing Devices") {
                    SettingsCell("Hearing Devices", color: .blue, symbol: "ear")
                }
                NavigationLink(value: "Audio") {
                    SettingsCell("Audio", color: .pink, symbol: "speaker.3.fill")
                }
                NavigationLink(value: "RTT") {
                    SettingsCell("RTT", color: .green, symbol: "teletype")
                }
                NavigationLink(value: "Captions") {
                    SettingsCell("Captions", color: .black, symbol: "captions.bubble.fill")
                }
                NavigationLink(value: "Live Captions") {
                    SettingsCell("Live Captions", color: .black, symbol: "waveform.bubble.fill")
                }
            }
            
            Section("Motor") {
                NavigationLink(value: "Voice Control") {
                    SettingsCell("Voice Control", color: .blue, symbol: "voice.control")
                }
                NavigationLink(value: "Keyboard") {
                    SettingsCell("Keyboard", color: .gray, symbol: "keyboard.fill")
                }
                NavigationLink(value: "Pointer Control") {
                    SettingsCell("Pointer Control", color: .gray, symbol: "cursorarrow.resize.north.east.south.east")
                }
                NavigationLink(value: "Switch Control") {
                    SettingsCell("Switch Control", color: .black, symbol: "square.grid.2x2")
                }
            }
            
            Section("Speech") {
                NavigationLink(value: "Live Speech") {
                    SettingsCell("Live Speech", color: .black, symbol: "keyboard.badge.waveform.fill")
                }
                NavigationLink(value: "Personal Voice") {
                    SettingsCell("Personal Voice", color: .blue, symbol: "person.badge.waveform.fill")
                }
                NavigationLink(value: "Vocal Shortcuts") {
                    SettingsCell("Vocal Shortcuts", color: .blue, symbol: "waveform.arrow.triangle.branch.right")
                }
            }
            
            Section("General") {
                NavigationLink(value: "Siri") {
                    SettingsCell("Siri", color: .blue, symbol: "siri")
                }
                NavigationLink(value: "Shortcut") {
                    SettingsCell("Shortcut", color: .blue, symbol: "accessibility.badge.arrow.up.right")
                }
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
