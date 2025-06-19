//
//  NetworkView.swift
//  System Settings
//
//  System Settings > Network
//

import SwiftUI

struct NetworkView: View {
    @State private var selection = "Automatic"
    let options = ["Automatic"]
    
    var body: some View {
        CustomForm(title: "Network") {
            Section {
                // Wi-Fi
                NavigationLink {} label: {
                    NetworkStatusView("Wi-Fi", status: .notConnected, symbol: "com.apple.graphic-icon.wifi", color: .blue)
                }
            }
            
            Section {
                // Firewall
                NavigationLink {} label: {
                    NetworkStatusView("Firewall", status: .inactive, symbol: "firewall.fill", color: .orange)
                }
            }
            
            Section {
                // Thunderbolt Bridge
                NavigationLink {} label: {
                    NetworkStatusView("Thunderbolt Bridge", status: .notConnected, symbol: "thunderbolt", color: .gray)
                }
            } header: {
                Text("Other Services")
            } footer: {
                HStack {
                    Spacer()
                    Menu {
                        Button("Add Service…") {}
                        Menu {
                            Button("\("L2TP over IPSec".localize(table: "VPN"))…") {}
                            Button("\("Cisco IPSec".localize(table: "VPN"))…") {}
                            Button("\("IKEv2".localize(table: "VPN"))…") {}
                        } label: {
                            Text("Add VPN Configuration", tableName: "VPN")
                        }
                        Divider()
                        Button("Manage Virtual Interfaces…") {}
                        Button("Set Service Order…") {}
                        Divider()
                        Menu {
                            Picker("", selection: $selection) {
                                ForEach(options, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.inline)
                            .labelsHidden()
                            Divider()
                            Button("Edit Locations…") {}
                        } label: {
                            Text("Locations")
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                    HelpButton(topicID: "mchlee7b367f")
                }
            }
        }
    }
}

/// A view that displays a simulated network interface option with an interface name, icon, and status.
struct NetworkStatusView: View {
    let titleKey: String
    let status: NetworkStatus
    let symbol: String
    let color: Color
    private var statusColor: Color {
        switch status {
        case .connected:
            return .green
        case .notConnected, .notConfigured:
            return .red
        case .inactive:
            return .gray
        }
    }
    private var statusText: String {
        switch status {
        case .connected:
            return "Connected"
        case .notConnected:
            return "Not connected"
        case .inactive:
            return "Inactive"
        case .notConfigured:
            return "Not configured"
        }
    }
    
    init(_ titleKey: String, status: NetworkStatus, symbol: String, color: Color) {
        self.titleKey = titleKey
        self.status = status
        self.symbol = symbol
        self.color = color
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            if symbol.contains("com.") {
                TestIconView(icon: symbol, size: 32)
                    .padding(-8)
            } else {
                IconView(symbol, color: color)
                    .scaleEffect(1.3)
                    .padding(.top, 2)
            }
            VStack(alignment: .leading) {
                Text(titleKey)
                HStack(spacing: 5) {
                    Image(systemName: "circle.fill")
                        .foregroundStyle(statusColor)
                        .imageScale(.small)
                    Text(statusText)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            }
            .offset(y: -6)
        }
        .padding([.leading, .top, .trailing], 6)
        .padding(.bottom, -6)
    }
}

enum NetworkStatus {
    case connected
    case notConnected
    case inactive
    case notConfigured
}

#Preview {
    NavigationStack {
        NetworkView()
    }
}
