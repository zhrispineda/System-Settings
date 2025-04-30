//
//  BluetoothView.swift
//  System Settings
//
//  System Settings > Bluetooth
//

import SwiftUI

struct BluetoothView: View {
    @State private var bluetoothEnabled = true
    let table = "Bluetooth"
    
    var body: some View {
        CustomForm(title: "bluetooth".localize(table: table)) {
            Section {
                HStack(alignment: .top, spacing: 15) {
                    IconView("bluetooth", color: .blue)
                        .scaleEffect(1.3)
                        .padding(.top, 2)
                    Toggle(isOn: $bluetoothEnabled) {
                        Text("bluetooth", tableName: table)
                        Text("\("bluetooth_tech_description".localize(table: table)) [\("learn_more".localize(table: table))](help:anchor=blth1004)")
                            .font(.callout)
                    }
                    .controlSize(.large)
                    .offset(y: -6)
                }
                .padding([.leading, .top, .trailing], 6)
                .padding(.bottom, -6)
                
                Text("now_discoverable_as_mac".localize(table: table, Host.current().localizedName ?? "Mac"))
                    .font(.callout)
                    .foregroundStyle(.secondary)
            } footer: {
                if !bluetoothEnabled {
                    HelpButton(topicID: "blth8111")
                }
            }
            
            if bluetoothEnabled {
                Section {
                    Text("empty_connected_paired_devices", tableName: table)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.secondary)
                } header: {
                    Text("my_devices", tableName: table)
                } footer: {
                    HelpButton(topicID: "blth8111")
                }
                
                Section {
                    Text("empty_nearby_devices", tableName: table)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.secondary)
                } header: {
                    HStack {
                        Text("nearby_devices", tableName: table)
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
