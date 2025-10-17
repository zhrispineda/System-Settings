//
//  SettingsSection.swift
//  System Settings
//

import SwiftUI

struct SettingsSection: View {
    @Environment(SettingsViewModel.self) private var model
    let options: [SettingsItem]
    
    var body: some View {
        Section {
            ForEach(options) { setting in
                if verifyCapabilities(capability: setting.capability) {
                    NavigationLink(value: setting) {
                        if model.selectedOption == setting && !model.path.isEmpty {
                            Button  {
                                model.path = []
                            } label: {
                                HStack(spacing: 3) {
                                    IconView(icon: setting.icon, size: 24)
                                    Text(setting.title)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(SelectedButtonStyle())
                        } else {
                            SettingsCell(setting.title, symbol: setting.icon, sidebar: true)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
        }
    }
}

struct SelectedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 4)
            .background(
                RoundedRectangle(cornerRadius: 8.0)
                    .foregroundStyle(configuration.isPressed ? Color(NSColor.selectedContentBackgroundColor).opacity(0.2) : Color.clear)
                    .padding(.vertical, -4)
            )
            ._safeAreaInsets(EdgeInsets(top: 0, leading: -6, bottom: 0, trailing: -6))
    }
}

@MainActor
func verifyCapabilities(capability: Capabilities) -> Bool {
    switch capability {
    case .hasBattery:
        return hasBattery() == true
    case .noBattery:
        return hasBattery() == false
    case .none:
        return true
    }
}

func hasBattery() -> Bool {
    guard let snapshot = IOPSCopyPowerSourcesInfo()?.takeRetainedValue(),
          let sources = IOPSCopyPowerSourcesList(snapshot)?.takeRetainedValue() as? [CFTypeRef]
    else {
        return false
    }

    for ps in sources {
        if let description = IOPSGetPowerSourceDescription(snapshot, ps)?.takeUnretainedValue() as? [String: Any],
           let type = description[kIOPSTransportTypeKey as String] as? String,
           type == kIOPSInternalType {
            return true
        }
    }

    return false
}

#Preview {
    ContentView()
        .environment(SettingsViewModel())
        .frame(height: 500)
}
