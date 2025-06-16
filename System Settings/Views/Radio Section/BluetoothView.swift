//
//  BluetoothView.swift
//  System Settings
//
//  System Settings > Bluetooth
//

import SwiftUI

struct BluetoothView: View {
    @State private var bluetoothEnabled = true
    let table = LocalizedStringResource.Bluetooth.self

    var body: some View {
        CustomForm(title: "bluetooth".localize(table: "Bluetooth")) {
            Section {
                HStack(alignment: .top, spacing: 15) {
                    IconView("bluetooth", color: .blue)
                        .scaleEffect(1.3)
                        .padding(.top, 2)
                    Toggle(isOn: $bluetoothEnabled) {
                        Text(table.bluetooth)
                        Text("\(table.bluetoothTechDescription) [\(table.learnMore)](help:anchor=blth1004)")
                            .font(.callout)
                    }
                    .controlSize(.large)
                    .offset(y: -6)
                }
                .padding([.leading, .top, .trailing], 6)
                .padding(.bottom, -6)

                Text(bluetoothEnabled ? table.nowDiscoverableAsMac(Host.current().localizedName ?? "Mac") : table.bluetoothControllerOff)
                    .font(.callout)
                    .foregroundStyle(.secondary)
            } footer: {
                if !bluetoothEnabled {
                    HelpButton(topicID: "blth8111")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            
            if bluetoothEnabled {
                Section {
                    Text(table.emptyConnectedPairedDevices)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.secondary)
                } header: {
                    Text(table.myDevices)
                } footer: {
                    HelpButton(topicID: "blth8111")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Section {
                    Text(table.emptyNearbyDevices)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.secondary)
                } header: {
                    HStack {
                        Text(table.nearbyDevices)
                        Spacer()
                        ProgressView()
                            .controlSize(.small)
                    }
                }
            }
        }
    }
}

#Preview {
    BluetoothView()
}
