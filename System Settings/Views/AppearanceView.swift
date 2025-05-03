//
//  AppearanceView.swift
//  System Settings
//
//  System Settings > Appearance
//

import SwiftUI

struct AppearanceView: View {
    @State private var selectedTheme = "AUTO"
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
    
    var body: some View {
        CustomForm(title: "APPEARANCE") {
            Section {
                HStack(alignment: .top) {
                    Text("APPEARANCE")
                    Spacer()
                    
                    DisplayButton(option: "LIGHT", helpText: "LIGHT_TOOLTIP", image: .appearanceLight, selected: $selectedTheme)
                    
                    DisplayButton(option: "DARK", helpText: "Uses a dark appearance for buttons, menus, and windows.", image: .appearanceDark, selected: $selectedTheme)
                    
                    DisplayButton(option: "AUTO", helpText: "AUTO_TOOLTIP", image: .appearanceAuto, selected: $selectedTheme)
                }
                
                Text("ACCENT_COLOR_TITLE")
                
                Picker("HIGHLIGHT_COLOR_TITLE", selection: $selectedHighlight) {
                    ForEach(highlightOptions, id: \.self) { color in
                        Text(color)
                        
                    }
                }
                
                Picker("SIDEBAR_ICON_SIZE_TITLE", selection: $selectedSidebar) {
                    ForEach(sidebarOptions, id: \.self) { size in
                        Text(size)
                    }
                }
                
                Toggle("ALLOW_WALLPAPER_TINTING_TITLE", isOn: $wallpaperTinting)
            }
            
            Section {
                Picker(selection: $selectedScroll, label: Text("SHOW_SCROLL_TITLE")) {
                    Text("SHOW_SCROLL_AUTOMATICALLY").tag(1)
                    Text("SHOW_SCROLL_WHEN_SCROLLING").tag(2)
                    Text("SHOW_SCROLL_ALWAYS").tag(3)
                }
                .pickerStyle(.radioGroup)
                
                VStack {
                    Picker("SCROLLER_CLICKS_TITLE", selection: $selectedClick) {
                        ForEach(clickOptions, id: \.self) { option in
                            Text(option)
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

struct DisplayButton: View {
    let option: String
    let helpText: String
    let image: ImageResource
    @Binding var selected: String
    
    var body: some View {
        Button {
            selected = option
        } label: {
            VStack {
                Image(image)
                    .background {
                        RoundedRectangle(cornerRadius: 5.0)
                            .stroke(selected == option ? .blue : .clear, lineWidth: 6)
                        RoundedRectangle(cornerRadius: 5.0)
                            .stroke(selected == option ? .white : .clear, lineWidth: 1)
                    }
                Text(option)
                    .font(.callout)
                    .fontWeight(selected == option ? .semibold : .regular)
                    .foregroundStyle(selected == option ? .primary : .secondary)
            }
            .help(helpText)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        AppearanceView()
    }
}
