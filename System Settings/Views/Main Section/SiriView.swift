//
//  SiriView.swift
//  System Settings
//
//  System Settings > Siri
//  System Settings > Apple Intelligence & Siri
//

import SwiftUI

struct SiriView: View {
    //@State private var appleIntelligenceEnabled = false
    @State private var selectedLanguage = "English (United States)"
    @State private var selectedListenOption = "OFF_KEY"
    @State private var selectedShortcutOption = "Hold 🎤︎"
    @State private var siriEnabled = false
    let listenOptions = ["“Siri“ or “Hey Siri“", "“Hey Siri“", "OFF_KEY"]
    let shortcutOptions = ["SAE_GLOBE_S", "Hold 🎤︎", "RIGHT_COMMAND_TWICE", "EITHER_COMMAND_TWICE", "CUSTOMIZE_KEY"]
    let languageOptions = ["English (United States)"]
    let bundle = Bundle(path: "/System/Library/ExtensionKit/Extensions/SiriPreferenceExtension.appex")
    
    var body: some View {
        CustomForm(title: "SIRI_SIDEBAR_TITLE_SAE".localize(bundle: bundle)) {
            Section {
                Placard(icon: "com.apple.application-icon.apple-intelligence") {
                    Text("SIRI_SIDEBAR_TITLE_SAE", bundle: bundle)
                    Text("\("A personal intelligence system integrated deeply into your Mac, apps, and Siri.") [\("Learn more…")](help:anchor=mchl46361784)")
                }
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .foregroundStyle(Color(NSColor.headerTextColor))
                        Text("GM_BETA_LABEL", bundle: bundle)
                            .font(.system(size: 7))
                            .foregroundStyle(Color(NSColor.gridColor))
                    }
                    .frame(width: 25, height: 10)
                    .offset(x: -195, y: 4)
                }
                Button("Turn on Apple Intelligence") {}.frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Text("Getting this Mac ready to use Apple Intelligence. Setup and activation of Apple Intelligence will continue in the background. Connect Mac to Wi-Fi and power while models are downloading. You’ll be notified when it’s ready.")
                .environment(\._lineHeightMultiple, 0.85)
                .font(.system(size: 11))
                .foregroundStyle(.secondary)
                .padding(.top, 2)
            
            Section {
                Toggle("SIRI_TITLE".localize(bundle: bundle), isOn: $siriEnabled)
                Picker("VOICE_ACTIVATION_PHRASE_TITLE".localize(bundle: bundle), selection: $selectedListenOption) {
                    ForEach(listenOptions, id: \.self) { option in
                        Text(option.localize(bundle: bundle))
                    }
                }
                .disabled(true)
                
                Picker("KEYBOARD_SHORTCUT_LABEL".localize(bundle: bundle), selection: $selectedShortcutOption) {
                    ForEach(shortcutOptions, id: \.self) { option in
                        if shortcutOptions.first == option || shortcutOptions[shortcutOptions.count - 2] == option {
                            Text(option.localize(bundle: bundle, "🎤︎"))
                            Divider()
                        } else {
                            Text(option.localize(bundle: bundle))
                        }
                    }
                }
                .disabled(true)
                
                Picker("LANGUAGE_LABEL".localize(bundle: bundle), selection: $selectedLanguage) {
                    ForEach(languageOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                .disabled(true)
                
                HStack {
                    LabeledContent("VOICE_LABEL".localize(bundle: bundle), value: "American (Voice 4)")
                    Button("SIRI_VOICE_BUTTON".localize(bundle: bundle)) {}.disabled(true)
                }
                
                HStack {
                    Text("DELETE_HISTORY_LABEL", bundle: bundle)
                    Spacer()
                    Button("DELETE_HISTORY_BUTTON".localize(bundle: bundle)) {}
                }
                
                Picker("Siri responses", selection: .constant(0)) {
                    Text("Prefer Silent Responses").tag(0)
                }
                .disabled(true)
            } header: {
                Text("SIRI_REQUESTS", bundle: bundle)
            }
            
            Section {} footer: {
                Button("Siri Suggestions & Privacy…") {}.frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    SiriView()
        .frame(width: 495, height: 710)
}
