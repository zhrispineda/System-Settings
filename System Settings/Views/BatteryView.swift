//
//  BatteryView.swift
//  System Settings
//
//  System Settings > Battery
//

import SwiftUI

struct BatteryView: View {
    @State private var selectedBattery = "ENERGY_MODE_AUTO"
    @State private var selectedPower = "ENERGY_MODE_AUTO"
    @State private var selectedTimeframe = "Last 24 Hours"
    let powerOptions = ["ENERGY_MODE_ECO", "ENERGY_MODE_AUTO", "ENERGY_MODE_PRO"]
    let timeframeOptions = ["Last 24 Hours", "Last 10 Days"]
    private var onBatteryText: String {
        switch selectedBattery {
        case "ENERGY_MODE_ECO":
            return "ENERGY_MODE_ECO_TEXT"
        case "ENERGY_MODE_PRO":
            return "ENERGY_MODE_PRO_TEXT"
        default:
            return "ENERGY_MODE_AUTO_TEXT"
        }
    }
    private var onPowerText: String {
        switch selectedPower {
        case "ENERGY_MODE_PRO":
            return "ENERGY_MODE_PRO_TEXT"
        case "ENERGY_MODE_ECO":
            return "ENERGY_MODE_ECO_ADAPTER_TEXT"
        default:
            return "ENERGY_MODE_AUTO_TEXT"
        }
    }
    
    var body: some View {
        CustomForm(title: "Battery") {
            Section {
                // Battery Health
                HStack {
                    LabeledContent("Battery Health", value: "Normal")
                    Button("", systemImage: "info.circle") {
                        
                    }
                    .buttonStyle(.plain)
                    .imageScale(.large)
                    .foregroundStyle(.secondary)
                    .offset(x: 5)
                }
            }
            
            // Energy Mode
            Section {
                VStack(alignment: .leading) {
                    Picker("On battery", selection: $selectedBattery) {
                        ForEach(powerOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                    Text(onBatteryText)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                VStack(alignment: .leading) {
                    Picker("On power adapter", selection: $selectedPower) {
                        ForEach(powerOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                    Text(onPowerText)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            } header: {
                VStack(alignment: .leading) {
                    Text("Energy Mode")
                    Text("Your Mac can optimize either its battery usage with Low Power Mode, or its performance in resource-intensive tasks with High Power Mode.")
                        .font(.callout)
                        .fontWeight(.regular)
                        .foregroundStyle(.secondary)
                }
            }
            
            // Battery usage
            Section {
                Picker("", selection: $selectedTimeframe) {
                    ForEach(timeframeOptions, id: \.self) { timeframe in
                        Text(timeframe)
                    }
                }
                .pickerStyle(.segmented)
                .fixedSize(horizontal: false, vertical: true)
                ._safeAreaInsets(EdgeInsets(top: 0, leading: -356, bottom: 0, trailing: 0))
                
                VStack(alignment: .leading) {
                    Text("Last charged to 100%")
                    Text("Today, 9:41 AM")
                        .font(.callout)
                        .fontWeight(.regular)
                        .foregroundStyle(.secondary)
                }
            } footer: {
                Spacer()
                Button("Options…") {}
                HelpButton(topicID: "mchlfc3b7879")
            }
        }
    }
}

#Preview {
    BatteryView()
        .frame(width: 500, height: 700)
}
