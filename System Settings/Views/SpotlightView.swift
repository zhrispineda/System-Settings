//
//  SpotlightView.swift
//  System Settings
//
//  System Settings > Spotlight
//

import SwiftUI

struct SpotlightView: View {
    @State private var applications = true
    @State private var calculator = true
    @State private var contacts = true
    @State private var conversion = true
    @State private var definition = true
    @State private var developer = true
    @State private var documents = true
    @State private var eventsReminders = true
    @State private var folders = true
    @State private var fonts = true
    @State private var images = true
    @State private var mailMessages = true
    @State private var movies = true
    @State private var music = true
    @State private var other = true
    @State private var PDFDocuments = true
    @State private var presentations = true
    @State private var siriSuggestions = true
    @State private var spreadsheets = true
    @State private var systemSettings = true
    @State private var tips = true
    @State private var websites = true
    @State private var improveSearch = true
    
    var body: some View {
        CustomForm(title: "Spotlight") {
            Section {
                HStack(alignment: .top, spacing: 15) {
                    IconView("magnifyingglass", color: .gray)
                        .scaleEffect(1.3)
                        .padding(.top, 2)
                    VStack(alignment: .leading) {
                        Text("Spotlight")
                        Text("Spotlight helps you quickly find things on your computer and shows suggestions from the Internet, Music, App Store, movie showtimes, locations nearby, and more.")
                            .foregroundStyle(.secondary)
                            .font(.footnote)
                    }
                }
                .padding([.leading, .top, .trailing], 6)
                .padding(.bottom, -6)
            }
            
            Section {
                VStack(alignment: .leading) {
                    Text("Search results")
                    Text("Only selected categories will appear in Spotlight search results.")
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                    Divider()
                        ._safeAreaInsets(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
                    Group {
                        Toggle("Applications", isOn: $applications)
                        CustomDivider()
                        Toggle("Calculator", isOn: $calculator)
                        CustomDivider()
                        Toggle("Contacts", isOn: $contacts)
                        CustomDivider()
                        Toggle("Conversion", isOn: $conversion)
                        CustomDivider()
                        Toggle("Definition", isOn: $definition)
                        CustomDivider()
                        Toggle("Developer", isOn: $developer)
                        CustomDivider()
                        Toggle("Documents", isOn: $documents)
                        CustomDivider()
                        Toggle("Events & Reminders", isOn: $eventsReminders)
                        CustomDivider()
                        Toggle("Folders", isOn: $folders)
                        CustomDivider()
                        Toggle("Fonts", isOn: $fonts)
                        CustomDivider()
                        Toggle("Images", isOn: $images)
                        CustomDivider()
                        Toggle("Mail & Messages", isOn: $mailMessages)
                        CustomDivider()
                        Toggle("Movies", isOn: $movies)
                        CustomDivider()
                        Toggle("Music", isOn: $music)
                        CustomDivider()
                        Toggle("Other", isOn: $other)
                        CustomDivider()
                        Toggle("PDF Documents", isOn: $PDFDocuments)
                        CustomDivider()
                        Toggle("Presentations", isOn: $presentations)
                        CustomDivider()
                        Toggle("Siri Suggestions", isOn: $siriSuggestions)
                        CustomDivider()
                        Toggle("Spreadsheets", isOn: $spreadsheets)
                        CustomDivider()
                        Toggle("System Settings", isOn: $systemSettings)
                        CustomDivider()
                        Toggle("Tips", isOn: $tips)
                        CustomDivider()
                        Toggle("Websites", isOn: $websites)
                    }
                    .toggleStyle(.checkbox)
                    ._safeAreaInsets(EdgeInsets(top: -3, leading: 0, bottom: -3, trailing: 0))
                }
            }
            
            Section {
                Toggle("Help Apple Improve Search", isOn: $improveSearch)
                VStack(alignment: .leading) {
                    Text("Help improve Search by allowing Apple to store your Safari, Siri, Spotlight, Lookup, and #images search queries. The information collected is stored in a way that does not identify you and is used to improve search results.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Divider().opacity(0.0)
                    Text("Searches include general knowledge queries and requests to do things like play music and get directions. [About Search & Privacy…]()")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                
            } footer: {
                Button("Search Privacy…") {}
                HelpButton(topicID: "mchl54d95e8a")
            }
        }
    }
}

struct CustomDivider: View {
    var body: some View {
        Divider()
            ._safeAreaInsets(EdgeInsets(top: 4, leading: 20, bottom: 0, trailing: 0))
    }
}

#Preview {
    SpotlightView()
}
