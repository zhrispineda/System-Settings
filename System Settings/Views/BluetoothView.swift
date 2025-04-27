//
//  BluetoothView.swift
//  System Settings
//
//  System Settings > Bluetooth
//

import SwiftUI

struct BluetoothView: View {
    @State private var bluetoothEnabled = true
    
    var body: some View {
        Section {
            HStack(alignment: .top, spacing: 15) {
                IconView("bluetooth", color: .blue)
                    .scaleEffect(1.3)
                    .padding(.top, 2)
                Toggle(isOn: $bluetoothEnabled) {
                    Text("Bluetooth")
                    Text("Connect to accessories you can use for activities such as streaming music, typing, and gaming. [Learn more…](help:anchor=blth1004)")
                        .font(.callout)
                }
                .controlSize(.large)
                .offset(y: -6)
            }
            .padding([.leading, .top, .trailing], 6)
            .padding(.bottom, -6)
            
            Text(bluetoothEnabled ? "This Mac is discoverable as “\(Host.current().localizedName ?? "")“ while Bluetooth Settings is open." : "AirDrop, AirPlay, Find My, and Location Services use Bluetooth.")
                .font(.callout)
                .foregroundStyle(.secondary)
        } footer: {
            if !bluetoothEnabled {
                Button {
                    if let url = URL(string: "help:anchor=blth8111") {
                        NSWorkspace.shared.open(url)
                    }
                } label: {
                    Image(systemName: "questionmark.circle.fill")
                        .fontWeight(.regular)
                        .foregroundStyle(.primary, Color(NSColor.controlColor))
                        .imageScale(.large)
                        .shadow(radius: 0.5)
                }
                .buttonStyle(.plain)
                .scaleEffect(1.2)
            }
        }
        
        if bluetoothEnabled {
            Section {
                Text("No Bluetooth Devices")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.secondary)
            } header: {
                Text("My Devices")
            } footer: {
                Button {
                    if let url = URL(string: "help:anchor=blth8111") {
                        NSWorkspace.shared.open(url)
                    }
                } label: {
                    Image(systemName: "questionmark.circle.fill")
                        .fontWeight(.regular)
                        .foregroundStyle(.primary, Color(NSColor.controlColor))
                        .imageScale(.large)
                        .shadow(radius: 0.5)
                }
                .buttonStyle(.plain)
                .scaleEffect(1.2)
            }
            
            Section {
                Text("No Nearby Devices")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.secondary)
            } header: {
                HStack {
                    Text("Nearby Devices")
                    Spacer()
                    ProgressView()
                        .controlSize(.small)
                }
            }
        }
    }
}

#Preview {
    BluetoothView()
}
