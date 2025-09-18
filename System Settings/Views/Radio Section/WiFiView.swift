//
//  WiFiView.swift
//  System Settings
//
//  System Settings > Wi-Fi
//

import SwiftUI

struct WiFiView: View {
    @AppStorage("WiFiEnabled") private var WiFiEnabled = false
    @AppStorage("AskJoinNetworks") private var askJoinNetworksIndex = 1
    @AppStorage("AskJoinHotspots") private var askJoinHotspotsIndex = 0
    @State private var localization = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/Wi-Fi.appex")
    let joinNetworkOptions = [
        "Off",
        "Notify",
        "Ask"
    ]
    let joinHotspotOptions = [
        "Personal Hotspot Never",
        "Personal Hotspot Ask To Join",
        "Personal Hotspot Automatic",
    ]
    
    var body: some View {
        CustomForm(title: "Wi‑Fi".localize(table: "Wi-Fi")) {
            Section {
                PlacardToggle(isOn: .constant(false), icon: "com.apple.graphic-icon.wifi") {
                    Text("Wi-Fi".localized(using: localization))
                    Text("\("Set up Wi‑Fi to wirelessly connect your Mac to the internet. Turn on Wi‑Fi, then choose a network to join.".localized(using: localization)) [\("Learn More…".localized(using: localization))](help:anchor=mchlp1180)")
                        .padding(.top, -0.5)
                }
                .disabled(true)
                
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundStyle(.red)
                        .imageScale(.small)
                    Text("WIFI_OFF".localized(using: localization))
                        .foregroundStyle(.secondary)
                    Spacer()
                    Button("Details…".localized(using: localization)) {}
                }
            }
            
            Section {
                Picker(selection: $askJoinNetworksIndex) {
                    ForEach(joinNetworkOptions.indices, id: \.self) { index in
                        Text(joinNetworkOptions[index].localized(using: localization))
                    }
                } label: {
                    Text("Ask to join networks".localized(using: localization))
                    switch askJoinNetworksIndex {
                    case 0:
                        Text("Known networks will be joined automatically. If no known networks are available, you will have to manually select a network.".localized(using: localization))
                    case 1:
                        Text("Known networks will be joined automatically. If no known networks are available, you will be notified of available networks.".localized(using: localization))
                    default:
                        Text("Known networks will be joined automatically. If no known networks are available, you will be asked before joining a new network.".localized(using: localization))
                    }
                }
                
                Picker(selection: $askJoinHotspotsIndex) {
                    ForEach(joinHotspotOptions.indices, id: \.self) { index in
                        Text(joinHotspotOptions[index].localized(using: localization))
                    }
                } label: {
                    Text("Ask to join hotspots".localized(using: localization))
                    Text("Allow this Mac to automatically discover nearby personal hotspots when no Wi‑Fi network is available.".localized(using: localization))
                }
            } footer: {
                HStack {
                    Spacer()
                    Button("Advanced…".localized(using: localization)) {}
                    HelpButton(topicID: "mh11935")
                }
                
            }
        }
    }
}

#Preview {
    WiFiView()
}
