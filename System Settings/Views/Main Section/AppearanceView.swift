//
//  AppearanceView.swift
//  System Settings
//
//  System Settings > Appearance
//

import SwiftUI

struct AppearanceView: View {
    @State private var localization = LocalizationManager(bundleURL:  "/System/Library/ExtensionKit/Extensions/Appearance.appex")
    @State private var selectedTheme = "Auto"
    @State private var selectedGlass = "Clear"
    @State private var selectedAccent = "Multicolor"
    @State private var selectedAccentColor = Color.blue
    @State private var selectedHighlight = "Accent Color"
    @State private var selectedFolderColor = FolderColor.automatic
    @State private var selectedSidebar = "Medium"
    @State private var selectedScroll = 1
    @State private var selectedClick = "Jump to the next page"
    @State private var wallpaperTinting = true
    @State private var accentHover = true
    let highlightOptions = ["Accent Color", "Blue", "Purple", "Pink", "Red", "Orange", "Yellow", "Green", "Graphite", "Other"]
    let sidebarOptions = ["Small", "Medium", "Large"]
    let clickOptions = ["Jump to the next page", "Jump to the spot that’s clicked"]

    var body: some View {
        CustomForm(title: "Appearance".localized(using: localization)) {
            Section {
                HStack(alignment: .top) {
                    Text("Appearance".localized(using: localization))

                    Spacer()

                    DisplayButton(option: "Auto", helpText: "Automatically adjusts the appearance of buttons, menus and windows throughout the day.", image: .appearanceAuto, selected: $selectedTheme, color: $selectedAccentColor, table: $localization)

                    DisplayButton(option: "Light", helpText: "Use a light appearance for buttons, menus, and windows.", image: .appearanceLight, selected: $selectedTheme, color: $selectedAccentColor, table: $localization)

                    DisplayButton(option: "Dark", helpText: "Use a dark appearance for buttons, menus, and windows.", image: .appearanceDark, selected: $selectedTheme, color: $selectedAccentColor, table: $localization)
                }
                
                HStack(alignment: .top) {
                    LabeledContent {} label: {
                        Text("Liquid Glass".localized(using: localization))
                        Text("Choose your preferred look for Liquid Glass.".localized(using: localization))
                    }

                    Spacer()

                    DisplayButton(option: "Clear", helpText: "Clear is more transparent, revealing the content beneath.", imageName: "GlassClear", selected: $selectedGlass, color: $selectedAccentColor, table: $localization)

                    DisplayButton(option: "Tinted", helpText: "Tinted increases opacity and adds more contrast.", imageName: "GlassTinted", selected: $selectedGlass, color: $selectedAccentColor, table: $localization)
                }
            }

            Section("Theme".localized(using: localization)) {
                HStack(alignment: .top, spacing: -3) {
                    Text("Color".localized(using: localization))
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

                Picker("Text highlight color".localized(using: localization), selection: $selectedHighlight) {
                    ForEach(highlightOptions, id: \.self) { color in
                        HStack {
                            switch color {
                            case "Accent Color":
                                Image(.nsMulticolorHighlight)
                            default:
                                Image(systemName: "circle.fill")
                            }
                            Text(color)
                        }
                        .selectionDisabled(selectedAccent != "Multicolor" && color == "Accent Color")
                    }
                }
            }

            Section {
                HStack {
                    Text("Icon & widget style".localized(using: localization))
                    Spacer()
                    BundleIconView(bundlePath: "/System/Applications/Weather.app", size: 36)
                }
                Picker("Folder color".localized(using: localization), selection: $selectedFolderColor) {
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

            Section("Windows".localized(using: localization)) {
                Picker("Sidebar icon size".localized(using: localization), selection: $selectedSidebar) {
                    ForEach(sidebarOptions, id: \.self) { size in
                        Text(size.localized(using: localization))
                    }
                }

                Toggle("Allow wallpaper tinting in windows".localized(using: localization), isOn: $wallpaperTinting)
            }

            Section {
                Picker(selection: $selectedScroll, label: Text("Show scroll bars".localized(using: localization))) {
                    Text("Automatically based on mouse or trackpad".localized(using: localization)).tag(1)
                    Text("When scrolling".localized(using: localization)).tag(2)
                    Text("Always-ScrollBar".localized(using: localization)).tag(3)
                }
                .pickerStyle(.radioGroup)

                VStack {
                    Picker("Click in the scroll bar to".localized(using: localization), selection: $selectedClick) {
                        ForEach(clickOptions, id: \.self) { option in
                            Text(option.localized(using: localization))
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
    var image: ImageResource = ImageResource(name: "", bundle: Bundle())
    var imageName: String = ""
    @Binding var selected: String
    @Binding var color: Color
    @Binding var table: LocalizationManager

    var body: some View {
        Button {
            withAnimation {
                selected = option
            }
        } label: {
            VStack {
                ZStack {
                    if imageName.isEmpty {
                        Image(image)
                            .background {
                                RoundedRectangle(cornerRadius: 5.0)
                                    .stroke(selected == option ? color : .clear, lineWidth: 6)
                                RoundedRectangle(cornerRadius: 5.0)
                                    .stroke(selected == option ? .white : .clear, lineWidth: 1)
                            }
                        Image(option == "Auto" ? .selectionColorMaskAuto : .selectionColorMask)
                            .foregroundStyle(color)
                    } else {
                        if let imageAsset = NSImage.asset(path: "/System/Library/ExtensionKit/Extensions/Appearance.appex", name: imageName) {
                            Image(nsImage: imageAsset)
                                .clipShape(RoundedRectangle(cornerRadius: 5.0))
                                .background {
                                    RoundedRectangle(cornerRadius: 5.0)
                                        .stroke(selected == option ? color : .clear, lineWidth: 6)
                                    RoundedRectangle(cornerRadius: 5.0)
                                        .stroke(selected == option ? .white : .clear, lineWidth: 1)
                                }
                        }
                    }
                }
                Text(option.localized(using: table))
                    .font(.callout)
                    .fontWeight(selected == option ? .semibold : .regular)
                    .foregroundStyle(selected == option ? .primary : .secondary)
            }
            .help(helpText.localized(using: table))
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
        case .other: return "Choose Color…"
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

