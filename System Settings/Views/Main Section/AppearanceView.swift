//
//  AppearanceView.swift
//  System Settings
//
//  System Settings > Appearance
//

import SwiftUI

struct AppearanceView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.accessibilityReduceTransparency) private var reduceTransparency
    @State private var selectedTheme = "Auto"
    @State private var selectedGlass = "Clear"
    @State private var selectedAccent = "Multicolor"
    @State private var selectedAccentColor = Color.blue
    @State private var selectedHighlight = "Automatic"
    @State private var selectedIconStyle = "Default"
    @State private var selectedIconStyleDarkTime = "Always"
    @State private var selectedIconStyleTime = "Dark"
    @State private var selectedFolderColor = FolderColor.automatic
    @State private var selectedSidebar = "Medium"
    @State private var selectedScroll = 1
    @State private var selectedClick = "Jump to the next page"
    @State private var wallpaperTinting = true
    @State private var accentHover = true
    private let localization = LocalizationManager(bundleURL:  "/System/Library/ExtensionKit/Extensions/Appearance.appex")
    let highlightOptions = ["Automatic", "Blue", "Purple", "Pink", "Red", "Orange", "Yellow", "Green", "Graphite", "Choose Color…"]
    let iconStyleDarkTimeOptions = ["Always", "Auto"]
    let iconStyleTimeOptions = ["Light", "Dark", "Auto"]
    let sidebarOptions = ["Small", "Medium", "Large"]
    let clickOptions = ["Jump to the next page", "Jump to the spot that’s clicked"]

    var body: some View {
        CustomForm(title: "Appearance".localized(using: localization)) {
            Section {
                HStack(alignment: .top) {
                    Text("Appearance".localized(using: localization))

                    Spacer()

                    DisplayButton(
                        option: "Auto",
                        helpText: "Automatically adjusts the appearance of buttons, menus and windows throughout the day.",
                        image: .appearanceAuto,
                        selected: $selectedTheme,
                        color: $selectedAccentColor
                    )
                    
                    DisplayButton(
                        option: "Light",
                        helpText: "Use a light appearance for buttons, menus, and windows.",
                        image: .appearanceLight,
                        selected: $selectedTheme,
                        color: $selectedAccentColor
                    )
                    
                    DisplayButton(
                        option: "Dark",
                        helpText: "Use a dark appearance for buttons, menus, and windows.",
                        image: .appearanceDark,
                        selected: $selectedTheme,
                        color: $selectedAccentColor
                    )
                }
                
                HStack(alignment: .top) {
                    LabeledContent {} label: {
                        Text("Liquid Glass".localized(using: localization))
                        Text(.init("\(reduceTransparency ? "Turn off Reduce Transparency and Increase Contrast to set a look for Liquid Glass. [Accessibility settings…](x-apple.systempreferences:com.apple.Accessibility-Settings.extension?Seeing_Display)" : "Choose your preferred look for Liquid Glass.")".localized(using: localization)))
                    }

                    Spacer()

                    Group {
                        DisplayButton(
                            option: "Clear",
                            helpText: "Clear is more transparent, revealing the content beneath.",
                            imageName: "GlassClear",
                            selected: $selectedGlass,
                            color: $selectedAccentColor
                        )
                        DisplayButton(
                            option: "Tinted",
                            helpText: "Tinted increases opacity and adds more contrast.",
                            imageName: "GlassTinted",
                            selected: $selectedGlass,
                            color: $selectedAccentColor
                        )
                    }
                    .disabled(reduceTransparency)
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

                Picker("Text highlight color".localized(using: localization), selection: $selectedHighlight) {
                    ForEach(highlightOptions, id: \.self) { color in
                        HStack {
                            switch color {
                            case "Automatic":
                                Image("NSMulticolorHighlight")
                            default:
                                Image(systemName: "circle.fill")
                                    .tint(.blue)
                            }
                            Text(color)
                        }
                        .selectionDisabled(selectedAccent != "Multicolor" && color == "Accent Color")
                    }
                }
            }

            Section {
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        Text("Icon & widget style".localized(using: localization))
                        Spacer()
                        IconStyleButton(
                            selectedIconStyle: $selectedIconStyle,
                            bundleID: "com.apple.weather",
                            appearance: .light,
                            variant: .none,
                            value: "Default"
                        )
                        IconStyleButton(
                            selectedIconStyle: $selectedIconStyle,
                            bundleID: "com.apple.weather",
                            appearance: .dark,
                            variant: .none,
                            value: "Dark"
                        )
                        IconStyleButton(
                            selectedIconStyle: $selectedIconStyle,
                            bundleID: "com.apple.weather",
                            appearance: colorScheme == .light ? .light : .dark,
                            variant: .clear,
                            value: "Clear"
                        )
                        IconStyleButton(
                            selectedIconStyle: $selectedIconStyle,
                            bundleID: "com.apple.weather",
                            appearance: colorScheme == .light ? .light : .dark,
                            variant: .tinted,
                            value: "Tinted",
                            color: NSColor(selectedAccentColor)
                        )
                    }
                    
                    if selectedIconStyle == "Dark" {
                        Picker("", selection: $selectedIconStyleDarkTime) {
                            ForEach(iconStyleDarkTimeOptions, id: \.self) { option in
                                Text(option)
                            }
                        }
                        .pickerStyle(.radioGroup)
                    } else if selectedIconStyle == "Clear" || selectedIconStyle == "Tinted" {
                        Picker("", selection: $selectedIconStyleTime) {
                            ForEach(iconStyleTimeOptions, id: \.self) { option in
                                Text(option)
                            }
                        }
                        .pickerStyle(.radioGroup)
                    }
                }
                
                Picker("\(selectedIconStyle == "Tinted" ? "Icon, widget & folder color" : "Folder color")".localized(using: localization), selection: $selectedFolderColor) {
                    ForEach(FolderColor.allCases) { option in
                        if FolderColor.automatic == option || FolderColor.graphite == option {
                            HStack {
                                Image(systemName: "circle.fill")
                                    .tint(option == .automatic ? selectedAccentColor : option.color)
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

                Toggle("Tint window background with wallpaper color".localized(using: localization), isOn: $wallpaperTinting)
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
    private let localization = LocalizationManager(bundleURL:  "/System/Library/ExtensionKit/Extensions/Appearance.appex")

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
                                RoundedRectangle(cornerRadius: 7.0)
                                    .stroke(selected == option ? color : .clear, lineWidth: 3)
                                    .padding(-2)
                            }
                        Image(option == "Auto" ? .selectionColorMaskAuto : .selectionColorMask)
                            .foregroundStyle(color)
                    } else {
                        if let imageAsset = NSImage.asset(path: "/System/Library/ExtensionKit/Extensions/Appearance.appex", name: imageName) {
                            Image(nsImage: imageAsset)
                                .clipShape(RoundedRectangle(cornerRadius: 5.0))
                                .background {
                                    RoundedRectangle(cornerRadius: 7.0)
                                        .stroke(selected == option ? color : .clear, lineWidth: 3)
                                        .padding(-2)
                                }
                        }
                    }
                }
                .shadow(radius: 1)
                
                Text(option.localized(using: localization))
                    .font(.callout)
                    .fontWeight(selected == option ? .semibold : .regular)
                    .foregroundStyle(selected == option ? .primary : .secondary)
            }
            .help(helpText.localized(using: localization))
        }
        .buttonStyle(.plain)
    }
}

struct IconStyleButton: View {
    @Binding var selectedIconStyle: String
    let bundleID: String
    let appearance: IconAppearance
    let variant: IconVariant
    let value: String
    var color: NSColor = .controlAccentColor
    private let localization = LocalizationManager(bundleURL:  "/System/Library/ExtensionKit/Extensions/Appearance.appex")
    
    var body: some View {
        Button {
            selectedIconStyle = value
        } label: {
            VStack {
                IconServicesPreview(
                    bundleID: self.bundleID,
                    appearance: self.appearance,
                    variant: self.variant,
                    color: self.color
                )
                .background {
                    if selectedIconStyle == value {
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(.blue, lineWidth: 3)
                            .padding(1)
                    }
                }
                Text(value.localized(using: localization))
                    .font(.subheadline)
                    .foregroundStyle(selectedIconStyle == value ? .primary : .secondary)
                    .fontWeight(selectedIconStyle == value ? .bold : .regular)
            }
        }
        .buttonStyle(.plain)
        .frame(minWidth: 44)
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

struct IconServicesPreview: View {
    @State private var icon: NSImage?
    let bundleID: String
    let appearance: IconAppearance
    let variant: IconVariant
    let size: CGFloat = 37
    var color: NSColor = .controlAccentColor
    
    var body: some View {
        ZStack {
            if let image = icon {
                Image(nsImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
            }
        }
        .onAppear {
            loadIcon()
        }
        .onChange(of: color) {
            loadIcon()
        }
    }
    
    private func loadIcon() {
        let iconData = IconServicesHelper.shared.getAppIcon(
            bundleID: bundleID,
            appearance: appearance,
            variant: variant,
            size: size,
            color: color
        )
        
        self.icon = iconData
    }
}

#Preview {
    NavigationStack {
        AppearanceView()
    }
    .frame(height: 500)
}

