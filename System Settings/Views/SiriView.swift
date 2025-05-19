//
//  SiriView.swift
//  System Settings
//
//  System Settings > Siri
//  System Settings > Apple Intelligence & Siri
//

import SwiftUI

struct SiriView: View {
    @State private var appleIntelligenceEnabled = true
    @State private var selectedLanguage = "English (United States)"
    @State private var selectedListenOption = "OFF_KEY"
    @State private var selectedShortcutOption = "LEFT_COMMAND_TWICE"
    @State private var siriEnabled = true
    let listenOptions = ["“Siri“ or “Hey Siri“", "“Hey Siri“", "OFF_KEY"]
    let shortcutOptions = ["SAE_GLOBE_S", "LEFT_COMMAND_TWICE", "RIGHT_COMMAND_TWICE", "EITHER_COMMAND_TWICE", "CUSTOMIZE_KEY"]
    let languageOptions = ["English (United States)"]
    let table = "SiriPreferenceExtension"
    let exTable = "AssistantSettings-ChatGPT"
    
    var body: some View {
        CustomForm(title: "SIRI_TITLE".localize(table: table)) {
            Section {
                HStack(alignment: .top, spacing: 15) {
                    IconView("Apple Intelligence & Siri", color: .clear)
                        .symbolRenderingMode(.multicolor)
                        .scaleEffect(1.3)
                        .overlay {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15.0)
                                    .foregroundStyle(Color(NSColor.headerTextColor))
                                Text("GM_BETA_LABEL", tableName: table)
                                    .font(.system(size: 7))
                                    .foregroundStyle(Color(NSColor.gridColor))
                            }
                            .frame(width: 25, height: 10)
                            .offset(x: 8, y: 10)
                        }
                    VStack(alignment: .leading) {
                        Text("SIRI_SIDEBAR_TITLE_SAE", tableName: table)
                        Text("\("A personal intelligence system integrated deeply into your Mac, apps, and Siri.") [\("Learn More…")](help:anchor=mchl46361784)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .offset(y: -6)
                }
                .padding([.leading, .top, .trailing], 6)
                .padding(.bottom, -6)
                
                Toggle("APPLE_INTELLIGENCE_TITLE".localize(table: table), isOn: $appleIntelligenceEnabled)
            }
            
            Section("SIRI_REQUESTS".localize(table: table)) {
                Toggle("SIRI_TITLE".localize(table: table), isOn: $siriEnabled)
                Picker("VOICE_ACTIVATION_PHRASE_TITLE".localize(table: table), selection: $selectedListenOption) {
                    ForEach(listenOptions, id: \.self) { option in
                        Text(option.localize(table: table))
                    }
                }
                VStack(alignment: .leading) {
                    Picker("KEYBOARD_SHORTCUT_LABEL".localize(table: table), selection: $selectedShortcutOption) {
                        ForEach(shortcutOptions, id: \.self) { option in
                            if shortcutOptions.first == option || shortcutOptions[shortcutOptions.count - 2] == option {
                                Text(option.localize(table: table))
                                Divider()
                            } else {
                                Text(option.localize(table: table))
                            }
                        }
                    }
                    Text("KEYBOARD_SHORTCUT_TYPE_TO_SIRI_DESCRIPTION", tableName: table)
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                }
                Picker("LANGUAGE_LABEL".localize(table: table), selection: $selectedLanguage) {
                    ForEach(languageOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                HStack {
                    LabeledContent("VOICE_LABEL".localize(table: table), value: "American (Voice 4)")
                    Button("SIRI_VOICE_BUTTON".localize(table: table)) {}
                }
                HStack {
                    Text("DELETE_HISTORY_LABEL", tableName: table)
                    Spacer()
                    Button("DELETE_HISTORY_BUTTON".localize(table: table)) {}
                }
                Text("\("GM_ASK_SIRI_DEVICE_PROCESSING_NO_SHARING_FOOTER_TEXT_MAC".localize(table: table))\n[\("SIRISUGGESTIONS_OPEN_BUTTON".localize(table: table))](#)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Section {
                Text("\("GM_PRIVACY_DESCRIPTION".localize(table: table))\n[About Apple Intelligence & Privacy…](#)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            } footer: {
                Button("About Siri, Dictation & Privacy…") {}
                Button("SIRI_RESPONSES_BUTTON".localize(table: table)) {}
            }
            
            Section {
                NavigationLink("EXTERNAL_AI_MODEL_NAME".localize(table: exTable)) {}
                Text("EXTERNAL_AI_MODEL_FOOTER_MAC", tableName: exTable)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            } header: {
                Text("EXTERNAL_AI_MODEL_GROUP".localize(table: exTable))
            } footer: {
                HelpButton(topicID: "mchl3fd7fc15")
            }
        }
    }
}

#Preview {
    SiriView()
        .frame(height: 710)
}
