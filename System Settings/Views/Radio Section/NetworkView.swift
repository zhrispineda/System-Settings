//
//  NetworkView.swift
//  System Settings
//
//  System Settings > Network
//

import SwiftUI

struct NetworkView: View {
    @State private var localization = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/Network.appex")
    @State private var selection = "Automatic"
    let options = ["Automatic"]
    
    var body: some View {
        CustomForm(title: "Network") {
            Section {
                // Wi-Fi
                NavigationLink {} label: {
                    NetworkStatusView(localization: $localization, titleKey: "Wi-Fi", status: .notConnected, symbol: "com.apple.graphic-icon.wifi", color: .blue)
                }
            }
            
            Section {
                // Firewall
                NavigationLink {} label: {
                    NetworkStatusView(localization: $localization, titleKey: "FIREWALL_NAME".localized(using: localization), status: .inactive, symbol: "firewall.fill", color: .orange)
                }
            }
            
            Section {
                // Thunderbolt Bridge
                NavigationLink {} label: {
                    NetworkStatusView(localization: $localization, titleKey: "Thunderbolt Bridge", status: .notConnected, symbol: "thunderbolt", color: .gray)
                }
            } header: {
                Text("OTHER_SERVICES".localized(using: localization))
            } footer: {
                HStack {
                    Spacer()
                    Menu {
                        Button("SIDEBAR_POPOVER_ADD_SERVICE".localized(using: localization)) {}
                        Menu {
                            Button("L2TP over IPSec…".localized(using: localization)) {}
                            Button("Cisco IPSec…".localized(using: localization)) {}
                            Button("IKEv2…".localized(using: localization)) {}
                        } label: {
                            Text("Add VPN Configuration".localized(using: localization))
                        }
                        Divider()
                        Button("Manage Virtual Interfaces…".localized(using: localization)) {}
                        Button("SIDEBAR_POPOVER_SET_SERVICE_ORDER".localized(using: localization)) {}
                        Divider()
                        Menu {
                            Picker("", selection: $selection) {
                                ForEach(options, id: \.self) {
                                    Text($0.localized(using: localization))
                                }
                            }
                            .pickerStyle(.inline)
                            .labelsHidden()
                            Divider()
                            Button("EDIT_LOCATIONS".localized(using: localization)) {}
                        } label: {
                            Text("LOCATIONS".localized(using: localization))
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
    @Binding var localization: LocalizationManager
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
            return "Connected".localized(using: localization)
        case .notConnected:
            return "Not Connected".localized(using: localization)
        case .inactive:
            return "Inactive".localized(using: localization)
        case .notConfigured:
            return "Not Configured".localized(using: localization)
        }
    }
    
    init(localization: Binding<LocalizationManager>, titleKey: String, status: NetworkStatus, symbol: String, color: Color) {
        self._localization = localization
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

#Preview {
    NetworkStatusView(
        localization: .constant(LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/Network.appex")),
        titleKey: "Wi-Fi",
        status: .notConnected,
        symbol: "com.apple.graphic-icon.wifi",
        color: .blue
    )
}
