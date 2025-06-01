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
    let refreshOptions = ["ProMotion"]
    let tvOptions = ["Ask What to Show"]
    
    var body: some View {
        CustomForm(title: "Displays") {
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
                    Text("Using a scaled resolution may affect performance.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("")
            }
            
            Section {
                Slider(value: $brightness, in: 0.0...1.0) {
                        Text("Brightness")
                    } minimumValueLabel: {
                        Image(systemName: "sun.min.fill")
                            .font(.system(size: 13))
                    } maximumValueLabel: {
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 13))
                    }
                Toggle(isOn: $autoBrightness) {
                    Text("Automatically adjust brightness")
                    if !autoBrightness {
                        Text("\(Image(systemName: "exclamationmark.triangle.fill")) Energy usage may be higher when your display does not automatically adjust. Display and battery performance may also be reduced over time when this is turned off.")
                    }
                }
                Toggle(isOn: $autoBrightness) {
                    Text("True Tone")
                    Text("Automatically adapt display to make colors appear consistent in different ambient lighting conditions.")
                }
            }
            
            Section {
                Picker("Preset", selection: $preset) {
                    ForEach(presetOptions, id: \.self) { option in
                        Text(option)
                    }
                }
            }
            
            Section {
                Picker("Refresh rate", selection: $refreshRate) {
                    ForEach(refreshOptions, id: \.self) { option in
                        Text(option)
                    }
                }
            }
            
            Section {
                Picker(selection: $tvOption) {
                    ForEach(tvOptions, id: \.self) { option in
                        Text(option)
                    }
                } label: {
                    Text("When connected to TV")
                    Text("Choose what to show or use the TV as a secondary display.")
                }
            } footer: {
                Button("Advanced…") {}
                Button("Night Shift…") {}
                HelpButton(topicID: "mh40768")
            }
        }
    }
}

struct ResolutionOption: View {
    @Binding var selected: ImageResource
    @State private var hovering = false
    var title: String = ""
    var image: ImageResource
    var resolution: String
    
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
                Text(title)
                    .font(.system(size: 11))
                    .fontWeight(title == "Default" ? .semibold : .regular)
                Text(resolution)
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
