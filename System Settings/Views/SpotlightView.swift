//
//  SpotlightView.swift
//  System Settings
//
//  System Settings > Spotlight
//

import SwiftUI

struct SpotlightView: View {
    @State private var applications = true
    
    var body: some View {
        CustomForm(title: "Spotlight") {
            Section {
                HStack(alignment: .top, spacing: 15) {
                    IconView("magnifyingglass", color: .gray)
                        .scaleEffect(1.3)
                        .padding(.top, 2)
                    VStack(alignment: .leading) {
                        Text("Spotlight")
                        Text("Spotlight helps you quickly find things on your computer and shows suggestions from the Internet, Music, App Store, movie showtimes, locations nearby, and more.")
                            .foregroundStyle(.secondary)
                            .font(.footnote)
                    }
                }
                .padding([.leading, .top, .trailing], 6)
                .padding(.bottom, -6)
            }
            
            Section {
                VStack(alignment: .leading) {
                    Text("Search results")
                    Text("Only selected categories will appear in Spotlight search results.")
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                }
                Toggle("Applications", isOn: $applications)
                    .toggleStyle(.checkbox)
            }
        }
    }
}

#Preview {
    SpotlightView()
}
