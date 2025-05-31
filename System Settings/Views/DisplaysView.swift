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
