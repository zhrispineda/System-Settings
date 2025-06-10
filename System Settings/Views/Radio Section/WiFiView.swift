//
//  WiFiView.swift
//  System Settings
//
//  System Settings > Wi-Fi
//

import SwiftUI

struct WiFiView: View {
    @State private var WiFiEnabled = false
    @State private var askJoinNetworks = false
    @State private var askJoinHotspots = false
    let table = "Wi-Fi"
    
    var body: some View {
        CustomForm(title: "Wi‑Fi".localize(table: table)) {
            Section {
                HStack(alignment: .top, spacing: 15) {
                    IconView("wifi", color: .blue)
                        .scaleEffect(1.3)
                        .padding(.top, 2)
                    Toggle(isOn: $WiFiEnabled) {
                        Text("Wi‑Fi", tableName: table)
                        Text("\("Set up Wi‑Fi to wirelessly connect your Mac to the internet. Turn on Wi‑Fi, then choose a network to join.".localize(table: table)) [\("Learn More…".localize(table: table))](help:anchor=mchlp1180)")
                            .font(.callout)
                    }
                    .controlSize(.large)
                    .disabled(true)
                    .offset(y: -6)
                }
                .padding([.leading, .top, .trailing], 6)
                .padding(.bottom, -6)
                
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundStyle(.red)
                        .imageScale(.small)
                    Text("WIFI_OFF", tableName: table)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Button("Details…".localize(table: table)) {}
                }
            }
            
            Section {
                Toggle(isOn: $askJoinNetworks) {
                    Text("Ask to join networks", tableName: table)
                    Text("Known networks will be joined automatically. If no known networks are available, you will have to manually select a network.", tableName: table)
                }
                
                Toggle(isOn: $askJoinHotspots) {
                    Text("Ask to join hotspots", tableName: table)
                    Text("Allow this Mac to automatically discover nearby personal hotspots when no Wi‑Fi network is available.", tableName: table)
                }
            } footer: {
                HStack {
                    Spacer()
                    Button("Advanced…".localize(table: table)) {}
                    HelpButton(topicID: "mh11935")
                }
                
            }
        }
    }
}

#Preview {
    WiFiView()
}
