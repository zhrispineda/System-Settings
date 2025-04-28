//
//  GeneralView.swift
//  System Settings
//
//  System Settings > General
//

import SwiftUI

struct GeneralView: View {
    @State private var titleOpacity = 0.0
    
    var body: some View {
        Section {
            VStack(spacing: 5) {
                IconView("gear", color: .gray)
                    .scaleEffect(3.2)
                    .padding(.vertical, 25)
                    .overlay {
                        DividerGeometryView(dividerOpacity: $titleOpacity)
                    }
                Text("General")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Manage your overall setup and preferences for Mac, such as software updates, device language, AirDrop, and more.")
                    .foregroundStyle(.secondary)
                    .font(.callout)
                    .padding(.bottom, 5)
            }
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .navigationTitle(titleOpacity > 35.0 ? "General" : "")
        }
    }
}

#Preview {
    GeneralView()
}
