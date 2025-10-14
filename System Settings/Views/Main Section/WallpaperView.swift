//
//  WallpaperView.swift
//  System Settings
//
//  System Settings > Wallpaper
//

import SwiftUI

struct WallpaperView: View {
    @State private var showAllSpaces = true
    let options = ["Automatic", "Light", "Dark"]
    
    var body: some View {
        CustomForm(title: "Wallpaper") {
            Section("Dynamic Wallpapers") {
                
            }
        }
        .safeAreaBar(edge: .top) {
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 140)
                    .foregroundStyle(.background)
                HStack {
                    if let image = loadWallpaper(from: "/System/Library/CoreServices/DefaultDesktop.heic") {
                        Image(nsImage: image)
                            .resizable()
                            .frame(width: 160, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 5.0))
                            .padding([.leading, .bottom], 15)
                    }
                    Form {
                        Section {
                            Picker("Tahoe Day", selection: .constant("Automatic")) {
                                ForEach(options, id: \.self) { option in
                                    Text(option)
                                }
                            }
                            Toggle("Show on all Spaces", isOn: $showAllSpaces)
                        } footer: {
                            HStack {
                                Button("Screen Saver…") {}
                                Button("Clock Appearance…") {}
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, -10)
                        }
                    }
                    .contentMargins(.leading, -15)
                    .contentMargins(.horizontal, -5)
                    .formStyle(.grouped)
                    .frame(height: 150)
                    .scrollDisabled(true)
                }
            }
            Divider()
                .offset(y: 70)
        }
    }
    
    private func loadWallpaper(from path: String) -> NSImage? {
        let url = URL(fileURLWithPath: path)
        return NSImage(contentsOf: url)
    }
}

#Preview {
    WallpaperView()
}
