//
//  BluetoothView.swift
//  System Settings
//
//  System Settings > Bluetooth
//

import SwiftUI

struct BluetoothView: View {
    @State private var bluetoothEnabled = true
    @State private var localization = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/Bluetooth.appex")

    var body: some View {
        CustomForm(title: "bluetooth".localized(using: localization)) {
            Section {
                PlacardToggle(isOn: $bluetoothEnabled, icon: "com.apple.graphic-icon.bluetooth") {
                    Text("bluetooth".localized(using: localization))
                    Text("\("bluetooth_tech_description".localized(using: localization))[\("learn_more".localized(using: localization))](help:anchor=blth1004)")
                        .font(.callout)
                }

                Text(bluetoothEnabled ? "now_discoverable_as_mac".localizedFormatted(using: localization, Host.current().localizedName ?? "Mac") : "bluetooth_controller_off".localized(using: localization))
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
                    Text("empty_connected_paired_devices".localized(using: localization))
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.secondary)
                } header: {
                    Text("my_devices".localized(using: localization))
                } footer: {
                    HelpButton(topicID: "blth8111")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Section {
                    Text("empty_nearby_devices".localized(using: localization))
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.secondary)
                } header: {
                    HStack {
                        Text("nearby_devices".localized(using: localization))
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
