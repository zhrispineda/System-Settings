//
//  DisplaysView.swift
//  System Settings
//
//  System Settings > Displays
//

import SwiftUI

struct DisplaysView: View {
    @State private var hover = false
    @State private var selected: ImageResource = .resolution2
    @State private var brightness = 0.5
    @State private var autoBrightness = true
    @State private var trueTone = true
    @State private var preset = "Apple XDR Display (P3-1600 nits)"
    @State private var refreshRate = "ProMotion"
    @State private var tvOption = "Ask What to Show"
    let presetOptions = ["Apple XDR Display (P3-1600 nits)"]
    let refreshOptions = ["ProMotion", "60 Hertz", "59.94 Hertz", "50 Hertz", "48 Hertz", "47.95 Hertz"]
    let tvOptions = ["Ask What to Show", "Mirror Entire Screen", "Choose Window or App", "Use as Extended Display"]
    let table = "DisplaysExt"
    
    var body: some View {
        CustomForm(title: "Displays".localize(table: table)) {
            Section {
                VStack {
                    HStack(spacing: 10) {
                        ResolutionOption(selected: $selected, title: "Larger Text", image: .resolution5, resolution: "1168 × 755")
                        ResolutionOption(selected: $selected, image: .resolution4, resolution: "1312 × 848")
                        ResolutionOption(selected: $selected, image: .resolution3, resolution: "1496 × 967")
                        ResolutionOption(selected: $selected, title: "Default", image: .resolution2, resolution: "1728 × 1117")
                        ResolutionOption(selected: $selected, title: "More Space", image: .resolution1, resolution: "2056 × 1329")
                    }
                    .padding(.bottom, -15)
                    
                    HStack(spacing: 10) {
                        Image(.fadeLine)
                            .resizable()
                            .frame(width: 180, height: 1)
                            .padding(.trailing, 120)
                            .offset(y: -14)
                    }
                    .padding(.horizontal)
                }
                if selected != .resolution2 {
                    Text("Using a scaled resolution may affect performance.", tableName: table)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("") // Blank for padding above section
            }
            
            Section {
                Slider(value: $brightness, in: 0.0...1.0) {
                        Text("Brightness", tableName: table)
                    } minimumValueLabel: {
                        Image(systemName: "sun.min.fill")
                            .font(.system(size: 13))
                    } maximumValueLabel: {
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 13))
                    }
                Toggle(isOn: $autoBrightness) {
                    Text("Automatically adjust brightness", tableName: table)
                    if !autoBrightness {
                        Text("%@ Energy usage may be higher when your display does not automatically adjust. Display and battery performance may also be reduced over time when this is turned off.".localize(table: table, "⚠️"))
                    }
                }
                Toggle(isOn: $trueTone) {
                    Text("True Tone", tableName: table)
                    Text("Automatically adapt display to make colors appear consistent in different ambient lighting conditions.", tableName: table)
                }
            }
            
            Section {
                Picker("Preset".localize(table: table), selection: $preset) {
                    ForEach(presetOptions, id: \.self) { option in
                        Text(option)
                    }
                }
            }
            
            Section {
                Picker("Refresh rate".localize(table: table), selection: $refreshRate) {
                    ForEach(refreshOptions, id: \.self) { option in
                        if option == refreshOptions[0] {
                            Text(option)
                            Divider()
                        } else {
                            Text(option)
                        }
                    }
                }
            }
            
            Section {
                Picker(selection: $tvOption) {
                    ForEach(tvOptions, id: \.self) { option in
                        Text(option.localize(table: table))
                    }
                } label: {
                    Text("When connected to TV", tableName: table)
                    Text("Choose what to show or use the TV as a secondary display.", tableName: table)
                }
            } footer: {
                Button("Advanced…".localize(table: table)) {}
                Button("Night Shift…".localize(table: table)) {}
                HelpButton(topicID: "mh40768")
            }
        }
    }
}

struct ResolutionOption: View {
    @Binding var selected: ImageResource
    @State private var hovering = false
    var title: LocalizedStringKey = ""
    var image: ImageResource
    var resolution: LocalizedStringKey
    let table = "DisplaysExt"
    
    var body: some View {
        Button {
            selected = image
        } label: {
            VStack {
                Image(image)
                    .background {
                        if selected == image {
                            Image(.selected)
                        } else {
                            Image(.hover)
                                .opacity(hovering ? 1 : 0)
                        }
                    }
                    .onHover { hover in
                        hovering = hover
                    }
                Text(title, tableName: table)
                    .font(.system(size: 11))
                    .fontWeight(title == "Default" ? .semibold : .regular)
                Text(resolution, tableName: table)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .opacity(hovering ? 1 : 0)
            }
            .frame(width: 80)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    DisplaysView()
        .frame(width: 500, height: 700)
}
