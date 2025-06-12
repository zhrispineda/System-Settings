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
    @AppStorage("AskJoinHotspots") private var askJoinHotspotsIndex = 1
    let table = LocalizedStringResource.WiFi.self
    let joinNetworkOptions: [LocalizedStringResource] = [
        LocalizedStringResource.WiFi.off,
        LocalizedStringResource.WiFi.notify,
        LocalizedStringResource.WiFi.ask
    ]
    let joinHotspotOptions: [LocalizedStringResource] = [
        LocalizedStringResource.WiFi.personalHotspotNever,
        LocalizedStringResource.WiFi.personalHotspotAskToJoin,
        LocalizedStringResource.WiFi.personalHotspotAutomatic,
    ]
    
    var body: some View {
        CustomForm(title: "Wi‑Fi".localize(table: "Wi-Fi")) {
            Section {
                HStack(alignment: .top, spacing: 15) {
                    IconView("wifi", color: .blue)
                        .scaleEffect(1.3)
                        .padding(.top, 2)
                    Toggle(isOn: $WiFiEnabled) {
                        Text(table.wiFi)
                        Text("\(table.setUpWiFiToWirelesslyConnectYourMacToTheInternetTurnOnWiFiThenChooseANetworkToJoin) [\(table.learnMore)](help:anchor=mchlp1180)")
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
                    Text(table.wifiOff)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Button(table.details) {}
                }
            }
            
            Section {
                Picker(selection: $askJoinNetworksIndex) {
                    ForEach(joinNetworkOptions.indices, id: \.self) { index in
                        Text(joinNetworkOptions[index])
                    }
                } label: {
                    Text(table.askToJoinNetworks)
                    switch askJoinNetworksIndex {
                    case 0:
                        Text(table.knownNetworksWillBeJoinedAutomaticallyIfNoKnownNetworksAreAvailableYouWillHaveToManuallySelectANetwork)
                    case 1:
                        Text(table.knownNetworksWillBeJoinedAutomaticallyIfNoKnownNetworksAreAvailableYouWillBeNotifiedOfAvailableNetworks)
                    default:
                        Text(table.knownNetworksWillBeJoinedAutomaticallyIfNoKnownNetworksAreAvailableYouWillBeAskedBeforeJoiningANewNetwork)
                    }
                }
                
                Picker(selection: $askJoinHotspotsIndex) {
                    ForEach(joinHotspotOptions.indices, id: \.self) { index in
                        Text(joinHotspotOptions[index])
                    }
                } label: {
                    Text(table.askToJoinHotspots)
                    Text(table.allowThisMacToAutomaticallyDiscoverNearbyPersonalHotspotsWhenNoWiFiNetworkIsAvailable)
                }
            } footer: {
                HStack {
                    Spacer()
                    Button(table.advanced) {}
                    HelpButton(topicID: "mh11935")
                }
                
            }
        }
    }
}

#Preview {
    WiFiView()
}
