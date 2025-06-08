//
//  AppearanceView.swift
//  System Settings
//
//  System Settings > Appearance
//

import SwiftUI

struct AppearanceView: View {
    @State private var selectedTheme = "AUTO"
    @State private var selectedAccent = "Multicolor"
    @State private var selectedAccentColor = Color.blue
    @State private var selectedHighlight = "Accent Color"
    @State private var selectedSidebar = "SIDEBAR_ICON_MEDIUM"
    @State private var selectedScroll = 1
    @State private var selectedClick = "NEXT_PAGE"
    @State private var wallpaperTinting = true
    let themeOptions = ["LIGHT", "DARK", "AUTO"]
    let highlightOptions = ["Accent Color", "Blue", "Purple", "Pink", "Red", "Orange", "Yellow", "Green", "Graphite", "Other"]
    let sidebarOptions = ["SIDEBAR_ICON_SMALL", "SIDEBAR_ICON_MEDIUM", "SIDEBAR_ICON_LARGE"]
    let scrollOptions = ["SHOW_SCROLL_AUTOMATICALLY", "SHOW_SCROLL_WHEN_SCROLLING", "SHOW_SCROLL_ALWAYS"]
    let clickOptions = ["NEXT_PAGE", "GO_THERE"]
    let table = "Appearance"
    
    var body: some View {
        CustomForm(title: "APPEARANCE".localize(table: table)) {
            Section {
                HStack(alignment: .top) {
                    Text("APPEARANCE", tableName: table)
                    Spacer()
                    
                    DisplayButton(option: "LIGHT", helpText: "LIGHT_TOOLTIP", image: .appearanceLight, selected: $selectedTheme, color: $selectedAccentColor)
                    
                    DisplayButton(option: "DARK", helpText: "DARK_TOOLTIP", image: .appearanceDark, selected: $selectedTheme, color: $selectedAccentColor)
                    
                    DisplayButton(option: "AUTO", helpText: "AUTO_TOOLTIP", image: .appearanceAuto, selected: $selectedTheme, color: $selectedAccentColor)
                }
                
                HStack(alignment: .top) {
                    Text("ACCENT_COLOR_TITLE", tableName: table)
                    Spacer()
                    AccentButton(label: "Multicolor", option: .clear, selected: $selectedAccent, accent: $selectedAccentColor)
                    AccentButton(label: "Blue", option: .blue, selected: $selectedAccent, accent: $selectedAccentColor)
                    AccentButton(label: "Purple", option: .purple, selected: $selectedAccent, accent: $selectedAccentColor)
                    AccentButton(label: "Pink", option: .pink, selected: $selectedAccent, accent: $selectedAccentColor)
                    AccentButton(label: "Red", option: .red, selected: $selectedAccent, accent: $selectedAccentColor)
                    AccentButton(label: "Orange", option: .orange, selected: $selectedAccent, accent: $selectedAccentColor)
                    AccentButton(label: "Yellow", option: .yellow, selected: $selectedAccent, accent: $selectedAccentColor)
                    AccentButton(label: "Green", option: .green, selected: $selectedAccent, accent: $selectedAccentColor)
                    AccentButton(label: "Graphite", option: .gray, selected: $selectedAccent, accent: $selectedAccentColor)
                }
                .onChange(of: selectedAccent) {
                    if selectedAccent == "Multicolor" {
                        selectedHighlight = "Accent Color"
                    } else {
                        selectedHighlight = selectedAccent
                    }
                }
                
                Picker("HIGHLIGHT_COLOR_TITLE".localize(table: table), selection: $selectedHighlight) {
                    ForEach(highlightOptions, id: \.self) { color in
                        HStack {
                            switch color {
                            case "Accent Color":
                                Image(.nsMulticolorHighlight)
                            default:
                                EmptyView()
                            }
                            Text(color)
                        }
                        .selectionDisabled(selectedAccent != "Multicolor" && color == "Accent Color")
                    }
                }
                
                Picker("SIDEBAR_ICON_SIZE_TITLE".localize(table: table), selection: $selectedSidebar) {
                    ForEach(sidebarOptions, id: \.self) { size in
                        Text(size.localize(table: table))
                    }
                }
                
                Toggle("ALLOW_WALLPAPER_TINTING_TITLE".localize(table: table), isOn: $wallpaperTinting)
            }
            
            Section {
                Picker(selection: $selectedScroll, label: Text("SHOW_SCROLL_TITLE", tableName: table)) {
                    Text("SHOW_SCROLL_AUTOMATICALLY", tableName: table).tag(1)
                    Text("SHOW_SCROLL_WHEN_SCROLLING", tableName: table).tag(2)
                    Text("SHOW_SCROLL_ALWAYS", tableName: table).tag(3)
                }
                .pickerStyle(.radioGroup)
                
                VStack {
                    Picker("SCROLLER_CLICKS_TITLE".localize(table: table), selection: $selectedClick) {
                        ForEach(clickOptions, id: \.self) { option in
                            Text(option.localize(table: table))
                        }
                    }
                    .pickerStyle(.radioGroup)
                }
            } footer: {
                HelpButton(topicID: "mchlp1225")
            }
        }
    }
}

struct AccentButton: View {
    let label: String
    let option: Color
    @Binding var selected: String
    @Binding var accent: Color
    
    var body: some View {
        VStack {
            Button {
                accent = option == .clear ? .blue : option
                selected = label
            } label: {
                VStack {
                    ZStack {
                        if option == .clear {
                            Image(.nsMulticolorAccent)
                                .mask(Circle())
                        } else {
                            Circle()
                                .foregroundStyle(option)
                        }
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 1)
                            .frame(width: 15, height: 15)
                        if label == selected {
                            Circle()
                                .foregroundStyle(.white)
                                .frame(width: 5, height: 5)
                                .shadow(radius: 1)
                        }
                    }
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.blue)
                }
            }
            .buttonStyle(.plain)
            .help(label)
            
            if label == selected {
                Text(label)
                    .foregroundStyle(.secondary)
                    .fixedSize()
                    .frame(width: 15)
                    .lineLimit(1)
                    .font(.footnote)
                    .offset(x: option == .gray ? -13 : 0)
            }
        }
    }
}

struct DisplayButton: View {
    let option: String
    let helpText: String
    let image: ImageResource
    @Binding var selected: String
    @Binding var color: Color
    
    var body: some View {
        Button {
            selected = option
        } label: {
            VStack {
                ZStack {
                    Image(image)
                        .background {
                            RoundedRectangle(cornerRadius: 5.0)
                                .stroke(selected == option ? color : .clear, lineWidth: 6)
                            RoundedRectangle(cornerRadius: 5.0)
                                .stroke(selected == option ? .white : .clear, lineWidth: 1)
                        }
                    Image(option == "AUTO" ? .selectionColorMaskAuto : .selectionColorMask)
                        .foregroundStyle(color)
                }
                Text(option.localize(table: "Appearance"))
                    .font(.callout)
                    .fontWeight(selected == option ? .semibold : .regular)
                    .foregroundStyle(selected == option ? .primary : .secondary)
            }
            .help(helpText.localize(table: "Appearance"))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        AppearanceView()
    }
}
