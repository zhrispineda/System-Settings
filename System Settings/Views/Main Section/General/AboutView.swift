//
//  AboutView.swift
//  System Settings
//
//  System Settings > General > About
//

import SwiftUI

struct AboutView: View {
    let macInfo = MacInfo()
    
    var body: some View {
        CustomForm(title: "About", root: false) {
            Section {} header: {
                HStack {
                    Spacer()
                    VStack(spacing: 0) {
                        if let deviceImage = macInfo.color() {
                            Image(nsImage: deviceImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140)
                        }
                        Text(macInfo.model().name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(macInfo.model().year)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundStyle(.tertiary)
                    }
                    Spacer()
                }
                
                
            }
        }
    }
}

#Preview {
    AboutView()
}
