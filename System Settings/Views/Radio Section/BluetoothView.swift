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
                PlacardToggle(isOn: $bluetoothEnabled, icon: "com.apple.graphic-icon.bluetooth", title: Text(table.bluetooth), subtitle: Text("\(table.bluetoothTechDescription) [\(table.learnMore)](help:anchor=blth1004)"))

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
