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
    @State private var improveSearch = true
    @State private var showingPrivacy = false
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
    @State private var appsResults = true
    @State private var docsResults = true
    @State private var folderResults = true
    @State private var phoneAppResults = true
    @State private var menuItemResults = true
    @State private var clipboard = false
    
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
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.AppStore", size: 24)
                        Text("App Store".localized(using: frameworkTable))
                    }
                }
                Toggle(isOn: $books) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.iBooksX", size: 24)
                        Text("Books")
                    }
                }
                Toggle(isOn: $calculator) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.calculator", size: 24)
                        Text("Calculator")
                    }
                }
                Toggle(isOn: $calendar) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.iCal", size: 24)
                        Text("Calendar")
                    }
                }
                Toggle(isOn: $contacts) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.AddressBook", size: 24)
                        Text("Contacts")
                    }
                }
                Toggle(isOn: $dictionary) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.dictionary", size: 24)
                        Text("Dictionary")
                    }
                }
                Toggle(isOn: $mail) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.mail", size: 24)
                        Text("Mail")
                    }
                }
                Toggle(isOn: $messages) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.MobileSMS", size: 24)
                        Text("Messages")
                    }
                }
                Toggle(isOn: $notes) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.notes", size: 24)
                        Text("Notes")
                    }
                }
                Toggle(isOn: $photos) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.photos", size: 24)
                        Text("Photos")
                    }
                }
                Toggle(isOn: $podcasts) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.podcasts", size: 24)
                        Text("Podcasts")
                    }
                }
                Toggle(isOn: $reminders) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.reminders", size: 24)
                        Text("Reminders")
                    }
                }
                Toggle(isOn: $safari) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.safari", size: 24)
                        Text("Safari")
                    }
                }
                Toggle(isOn: $shortcuts) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.shortcuts", size: 24)
                        Text("Shortcuts")
                    }
                }
                Toggle(isOn: $systemSettings) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.systempreferences", size: 24)
                        Text("System Settings")
                    }
                }
                Toggle(isOn: $tips) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.tips", size: 24)
                        Text("Tips")
                    }
                }
                Toggle(isOn: $voiceMemos) {
                    HStack(spacing: 6) {
                        TestIconView(icon: "com.apple.voicememos", size: 24)
                        Text("Voice Memos")
                    }
                }
            }
            
            Section {
                LabeledContent {} label: {
                    Text("Results from System".localized(using: frameworkTable))
                    Text("Allows items and their content to appear in Spotlight.".localized(using: frameworkTable))
                }
                Toggle("Apps".localized(using: frameworkTable), isOn: $appsResults)
                Toggle(isOn: $docsResults) {
                    HStack {
                        Text("Documents".localized(using: frameworkTable))
                        Spacer()
                        Button("", systemImage: "info.circle") {
                            
                        }
                        .buttonStyle(.plain)
                        .foregroundStyle(.secondary)
                        .frame(width: 0)
                    }
                }
                Toggle("Folders".localized(using: frameworkTable), isOn: $folderResults)
                Toggle("iPhone Apps".localized(using: frameworkTable), isOn: $phoneAppResults)
                Toggle("Menu Items".localized(using: frameworkTable), isOn: $menuItemResults)
            }
            
            Section {
                Toggle(isOn: $clipboard) {
                    Text("Clipboard Search".localized(using: table))
                    Text("Allow Spotlight to search and display items you’ve copied to your clipboard. Items on your clipboard will be available for eight hours. Personal and sensitive information may appear in search results.".localized(using: table))
                }
            } footer: {
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
