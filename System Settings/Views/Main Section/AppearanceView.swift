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
    @State private var selectedFolderColor = FolderColor.automatic
    @State private var selectedSidebar = "SIDEBAR_ICON_MEDIUM"
    @State private var selectedScroll = 1
    @State private var selectedClick = "NEXT_PAGE"
    @State private var wallpaperTinting = true
    @State private var accentHover = true
    let themeOptions = ["AUTO", "LIGHT", "DARK"]
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

                    DisplayButton(option: "AUTO", helpText: "AUTO_TOOLTIP", image: .appearanceAuto, selected: $selectedTheme, color: $selectedAccentColor)

                    DisplayButton(option: "LIGHT", helpText: "LIGHT_TOOLTIP", image: .appearanceLight, selected: $selectedTheme, color: $selectedAccentColor)

                    DisplayButton(option: "DARK", helpText: "DARK_TOOLTIP", image: .appearanceDark, selected: $selectedTheme, color: $selectedAccentColor)
                }
            }

            Section("Theme") {
                HStack(alignment: .top, spacing: -3) {
                    Text("ACCENT_COLOR_TITLE", tableName: table)
                    Spacer()
                    AccentButton(label: "Multicolor", option: .clear, selected: $selectedAccent, accent: $selectedAccentColor, accentHover: $accentHover)
                    AccentButton(label: "Blue", option: .blue, selected: $selectedAccent, accent: $selectedAccentColor, accentHover: $accentHover)
                    AccentButton(label: "Purple", option: .purple, selected: $selectedAccent, accent: $selectedAccentColor, accentHover: $accentHover)
                    AccentButton(label: "Pink", option: .pink, selected: $selectedAccent, accent: $selectedAccentColor, accentHover: $accentHover)
                    AccentButton(label: "Red", option: .red, selected: $selectedAccent, accent: $selectedAccentColor, accentHover: $accentHover)
                    AccentButton(label: "Orange", option: .orange, selected: $selectedAccent, accent: $selectedAccentColor, accentHover: $accentHover)
                    AccentButton(label: "Yellow", option: .yellow, selected: $selectedAccent, accent: $selectedAccentColor, accentHover: $accentHover)
                    AccentButton(label: "Green", option: .green, selected: $selectedAccent, accent: $selectedAccentColor, accentHover: $accentHover)
                    AccentButton(label: "Graphite", option: .gray, selected: $selectedAccent, accent: $selectedAccentColor, accentHover: $accentHover)
                }
                .onChange(of: selectedAccent) {
                    if selectedAccent == "Multicolor" {
                        selectedHighlight = "Accent Color"
                    } else {
                        selectedHighlight = selectedAccent
                    }
                }

                Picker("Text highlight color".localize(table: table), selection: $selectedHighlight) {
                    ForEach(highlightOptions, id: \.self) { color in
                        HStack {
                            switch color {
                            case "Accent Color":
                                Image(.nsMulticolorHighlight)
                                    .clipShape(Circle())
                            default:
                                EmptyView()
                            }
                            Text(color)
                        }
                        .selectionDisabled(selectedAccent != "Multicolor" && color == "Accent Color")
                    }
                }
            }

            Section {
                Text("Icon & widget style")
                Picker("Folder color", selection: $selectedFolderColor) {
                    ForEach(FolderColor.allCases) { option in
                        if FolderColor.automatic == option || FolderColor.graphite == option {
                            HStack {
                                Image(systemName: "circle.fill")
                                    .tint(option.color)
                                Text(option.label)
                            }
                            .tag(option)
                            Divider()
                        } else {
                            HStack {
                                if option.color != .clear {
                                    Image(systemName: "circle.fill")
                                        .tint(option.color)
                                }
                                Text(option.label)
                            }
                            .tag(option)
                        }
                    }
                }
            }

            Section("Windows") {
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
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

struct AccentButton: View {
    let label: String
    let option: Color
    @Binding var selected: String
    @Binding var accent: Color
    @Binding var accentHover: Bool
    @State private var hovering = false

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
                                .resizable()
                                .mask(Circle())
                        } else {
                            Circle()
                                .foregroundStyle(option)
                        }

                        // Outline for each color
                        Circle()
                            .stroke(.black.opacity(0.3), lineWidth: 0.5)
                            .frame(width: 24, height: 24)
                            .background {
                                // Outer blue ring
                                Circle()
                                    .stroke(selected == label ? .blue : .clear, lineWidth: 3)
                                    .padding(-2)
                                // Inner white ring
                                Circle()
                                    .stroke(selected == label ? .white : .clear, lineWidth: 1)
                                    .padding(-0.5)
                            }
                    }
                    .frame(width: 38, height: 24)
                    .foregroundStyle(.blue)
                }
            }
            .buttonStyle(.plain)
            .help(label)
            .onContinuousHover { phase in
                switch phase {
                case .active:
                    hovering = true
                    accentHover = label == selected
                case .ended:
                    hovering = false
                    accentHover = true
                }
            }

            if hovering || (accentHover && label == selected) {
                Text(label)
                    .foregroundStyle(.secondary)
                    .fixedSize()
                    .frame(width: 15)
                    .lineLimit(1)
                    .font(.footnote)
                    .offset(x: option == .gray ? -10 : 0)
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

enum FolderColor: String, CaseIterable, Identifiable {
    case automatic
    case red
    case orange
    case yellow
    case green
    case blue
    case purple
    case pink
    case graphite
    case other

    var id: String { self.rawValue }

    var label: String {
        switch self {
        case .automatic: return "Automatic"
        case .red: return "Red"
        case .orange: return "Orange"
        case .yellow: return "Yellow"
        case .green: return "Green"
        case .blue: return "Blue"
        case .purple: return "Purple"
        case .pink: return "Pink"
        case .graphite: return "Graphite"
        case .other: return "Other"
        }
    }

    var color: Color {
        switch self {
        case .automatic: return .blue
        case .red: return .red
        case .orange: return .orange
        case .yellow: return .yellow
        case .green: return .green
        case .blue: return .blue
        case .purple: return .purple
        case .pink: return .pink
        case .graphite: return .gray
        case .other: return .clear
        }
    }
}

#Preview {
    NavigationStack {
        AppearanceView()
    }
}

