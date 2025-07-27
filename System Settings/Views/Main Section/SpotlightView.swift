//
//  SpotlightView.swift
//  System Settings
//
//  System Settings > Spotlight
//

import SwiftUI

struct SpotlightView: View {
    @State var table = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/SpotlightPreferenceExtension.appex")
    @State var frameworkTable = LocalizationManager(bundleURL: "/System/Library/PrivateFrameworks/Spotlight.framework")
    @State var privacyTable = LocalizationManager(bundleURL: "/System/Library/OnBoardingBundles/com.apple.onboarding.sirisuggestions.bundle", stringsFile: "SiriSuggestions")
    @State private var showRelatedContent = true
    @State private var appStore = true
    @State private var books = true
    @State private var calculator = true
    @State private var calendar = true
    @State private var contacts = true
    @State private var dictionary = true
    @State private var mail = true
    @State private var messages = true
    @State private var notes = true
    @State private var photos = true
    @State private var podcasts = true
    @State private var reminders = true
    @State private var safari = true
    @State private var shortcuts = true
    @State private var systemSettings = true
    @State private var tips = true
    @State private var voiceMemos = true
    @State private var improveSearch = true
    @State private var showingPrivacy = false
    
    var body: some View {
        CustomForm(title: "SPORTLIGHT".localized(using: table)) {
            Section {
                Placard(icon: "com.apple.spotlight") {
                    Text("SPORTLIGHT".localized(using: table))
                    Text("SPORTLIGHT_DESC".localized(using: table))
                }
            }
            
            Section {
                Toggle(isOn: $showRelatedContent) {
                    Text("Show Related Content".localized(using: table))
                    Text(.init("Allow content from Apple partners to be shown when searching or when looking up text or objects and photos. %@".localizedFormatted(using: table, "[\("BUTTON_TITLE".localized(using: privacyTable))](systempreferences://)")))
                }
            }
            
            Section {
                HStack {
                    LabeledContent {} label: {
                        Text("Reset Quick Keys".localized(using: table))
                        Text("Restore Spotlight Quick Keys to their default settings.".localized(using: table))
                    }
                    Button("Reset Quick Keys…".localized(using: table)) {}
                }
                HStack {
                    Text("Spotlight Search History".localized(using: table))
                    Spacer()
                    Button("Delete Search History…".localized(using: table)) {}
                }
            }
            
            Section {
                Toggle("SEARCH_ALLOW_ANONYMOUS_RECORDS".localized(using: table), isOn: $improveSearch)
                VStack(alignment: .leading) {
                    Text("SEARCH_ALLOW_ANONYMOUS_RECORDS_DESC".localized(using: table))
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text(.init("\("SEARCH_ALLOW_ANONYMOUS_RECORDS_FOOTER_FORMAT".localizedFormatted(using: table, "[\("BUTTON_TITLE".localized(using: privacyTable))](systempreferences://)"))"))
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            }
            
            Section {
                LabeledContent {} label: {
                    Text("Results from Apps".localized(using: frameworkTable))
                    Text("Allows app and its content to appear in Spotlight.".localized(using: frameworkTable))
                }
                Toggle(isOn: $appStore) {
                    HStack {
                        IconView("com.apple.AppStore")
                        Text("App Store".localized(using: frameworkTable))
                    }
                }
                Toggle(isOn: $books) {
                    HStack {
                        IconView("com.apple.iBooksX")
                        Text("Books")
                    }
                }
                Toggle(isOn: $calculator) {
                    HStack {
                        IconView("com.apple.calculator")
                        Text("Calculator")
                    }
                }
                Toggle(isOn: $calendar) {
                    HStack {
                        IconView("com.apple.iCal")
                        Text("Calendar")
                    }
                }
                Toggle(isOn: $contacts) {
                    HStack {
                        IconView("com.apple.AddressBook")
                        Text("Contacts")
                    }
                }
                Toggle(isOn: $dictionary) {
                    HStack {
                        IconView("com.apple.dictionary")
                        Text("Dictionary")
                    }
                }
                Toggle(isOn: $mail) {
                    HStack {
                        IconView("com.apple.mail")
                        Text("Mail")
                    }
                }
                Toggle(isOn: $messages) {
                    HStack {
                        IconView("com.apple.MobileSMS")
                        Text("Messages")
                    }
                }
                Toggle(isOn: $notes) {
                    HStack {
                        IconView("com.apple.notes")
                        Text("Notes")
                    }
                }
                Toggle(isOn: $photos) {
                    HStack {
                        IconView("com.apple.photos")
                        Text("Photos")
                    }
                }
                Toggle(isOn: $podcasts) {
                    HStack {
                        IconView("com.apple.podcasts")
                        Text("Podcasts")
                    }
                }
                Toggle(isOn: $reminders) {
                    HStack {
                        IconView("com.apple.reminders")
                        Text("Reminders")
                    }
                }
                Toggle(isOn: $safari) {
                    HStack {
                        IconView("com.apple.safari")
                        Text("Safari")
                    }
                }
                Toggle(isOn: $shortcuts) {
                    HStack {
                        IconView("com.apple.shortcuts")
                        Text("Shortcuts")
                    }
                }
                Toggle(isOn: $systemSettings) {
                    HStack {
                        IconView("com.apple.systempreferences")
                        Text("System Settings")
                    }
                }
                Toggle(isOn: $tips) {
                    HStack {
                        IconView("com.apple.tips")
                        Text("Tips")
                    }
                }
                Toggle(isOn: $voiceMemos) {
                    HStack {
                        IconView("com.apple.voicememos")
                        Text("Voice Memos")
                    }
                }
            }
            
            Section {} footer: {
                HStack {
                    Button("SEARCH_PRIVACY".localized(using: table)) {}
                    HelpButton(topicID: "mchl54d95e8a")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .background {
            OnBoardingKitControllerView(bundleIdentifier: "com.apple.onboarding.sirisuggestions", showPopover: $showingPrivacy) {
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
    SpotlightView()
        .frame(height: 700)
}
