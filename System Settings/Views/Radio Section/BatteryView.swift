//
//  BatteryView.swift
//  System Settings
//
//  System Settings > Battery
//

import SwiftUI
import Charts
import IOKit.ps

struct BatteryData {
    let date: Date
    let level: Double
    
    static let data: [BatteryData] = {
        var batteryDataArray = [BatteryData]()
        let timeInterval = 1000
        
        var currentLevel = 100.0
        
        for interval in stride(from: -23 * 3600, to: 3600, by: timeInterval) {
            let currentDate = Date() + TimeInterval(interval)
            let batteryData = BatteryData(date: currentDate, level: interval > 0 ? 0 : currentLevel)
            batteryDataArray.append(batteryData)
        }
        
        return batteryDataArray
    }()
}


struct BatteryChart: View {
    let hourFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h"
        return formatter
    }()
    
    var body: some View {
        Chart(BatteryData.data, id: \.date) {
            BarMark(
                x: .value("Time", $0.date ..< $0.date.advanced(by: 1000)),
                y: .value("Battery Level", $0.level)
            )
            .foregroundStyle(.green)
        }
        .chartXScale(domain: BatteryData.data.first!.date ... BatteryData.data.last!.date)
        .chartXAxis {
            AxisMarks(values: .stride(by: .hour, count: 3)) { value in
                if let date = value.as(Date.self) {
                    let hour = Calendar.current.component(.hour, from: date)
                    AxisValueLabel {
                        VStack(alignment: .leading) {
                            switch hour {
                            case 0, 12:
                                Text(date, format: .dateTime.hour(.defaultDigits(amPM: .narrow)))
                                    .textCase(.uppercase)
                            default:
                                Text(hourFormatter.string(from: date))
                            }
                        }
                    }
                    
                    AxisGridLine()
                    AxisTick()
                }
            }
        }
        .chartYAxis {
            AxisMarks(
                values: [0, 50, 100]
            ){
                AxisValueLabel(format: Decimal.FormatStyle.Percent.percent.scale(1))
            }
            AxisMarks(
                values: [0, 25, 50, 75, 100]
            ){
                AxisGridLine()
            }
        }
    }
}

struct BatteryView: View {
    @State private var localization = LocalizationManager(bundleURL: URL(fileURLWithPath: "/System/Library/ExtensionKit/Extensions/PowerPreferences.appex"), stringsFile: "BatteryUI")
    @State private var J316 = LocalizationManager(bundleURL: URL(fileURLWithPath: "/System/Library/ExtensionKit/Extensions/PowerPreferences.appex"), stringsFile: "BatteryUI-J316")
    @State private var powerTable = LocalizationManager(bundleURL: URL(fileURLWithPath: "/System/Library/ExtensionKit/Extensions/PowerPreferences.appex"))
    @State private var selectedBattery = "ENERGY_MODE_AUTO"
    @State private var selectedPower = "ENERGY_MODE_AUTO"
    @State private var selectedTimeframe = "HOURLY_GRAPH_TITLE_FMT"
    let powerOptions = ["ENERGY_MODE_ECO", "ENERGY_MODE_AUTO", "ENERGY_MODE_PRO"]
    let timeframeOptions = ["HOURLY_GRAPH_TITLE_FMT", "DAILY_GRAPH_TITLE_FMT"]
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
    private var batteryIcon: String {
        if isBatteryCharging() {
            return "battery.100percent.bolt"
        } else {
            switch getBatteryLevel() {
            case 50..<100:
                return "battery.75percent"
            case 30..<50:
                return "battery.50percent"
            case 0..<30:
                return "battery.25percent"
            default:
                return "battery.100percent"
            }
        }
    }
    private var batteryStatus: String {
        return isBatteryCharging() ? "Charging" : "Battery Level"
    }
    
    var body: some View {
        CustomForm(title: "") {
            Section {
                // Battery Health
                HStack {
                    LabeledContent("BATT_HEALTH_TITLE".localized(using: localization), value: "BATT_HEALTH_CONDITION_NORMAL".localized(using: localization))
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
                    Picker("On battery".localized(using: powerTable), selection: $selectedBattery) {
                        ForEach(powerOptions, id: \.self) { option in
                            if option == powerOptions[2] {
                                Text(option.localized(using: J316))
                            } else {
                                Text(option.localized(using: localization))
                            }
                        }
                    }
                    Text(onBatteryText.localized(using: localization))
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                VStack(alignment: .leading) {
                    Picker("On power adapter".localized(using: powerTable), selection: $selectedPower) {
                        ForEach(powerOptions, id: \.self) { option in
                            if option == powerOptions[2] {
                                Text(option.localized(using: J316))
                            } else {
                                Text(option.localized(using: localization))
                            }
                        }
                    }
                    Text(onPowerText.localized(using: localization))
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("Energy Mode".localized(using: powerTable))
                Text("Your Mac can optimize either its battery usage with Low Power Mode, or its performance in resource-intensive tasks with High Power Mode.".localized(using: powerTable))
            }
            
            // Battery usage
            Section {
                Picker("", selection: $selectedTimeframe) {
                    ForEach(timeframeOptions, id: \.self) { timeframe in
                        Text(timeframe.localizedFormatted(using: localization, timeframe == timeframeOptions[0] ? "24" : "10"))
                    }
                }
                .frame(maxWidth: .infinity)
                .pickerStyle(.palette)
                .labelsHidden()
                
                VStack(alignment: .leading) {
                    Text("LAST_CHARGED_TO_FMT".localizedFormatted(using: localization, "100%"))
                    Text("Today, 9:41 AM")
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundStyle(.secondary)
                }
                
                VStack(alignment: .leading) {
                    Text("BATTERY_LEVEL_GRAPH_TITLE".localized(using: localization))
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    BatteryChart()
                        .frame(height: 110)
                        .padding(.top, -5)
                }
                
                VStack(alignment: .leading) {
                    Text("SCREEN_ON_USAGE_GRAPH_TITLE".localized(using: localization))
                        .font(.headline)
                        .fontWeight(.bold)
                }
            } footer: {
                HStack {
                    Button("Options…".localized(using: powerTable)) {}
                    HelpButton(topicID: "mchlfc3b7879")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .safeAreaBar(edge: .top) {
            VStack(alignment: .leading, spacing: 0) {
                Text("BATTERY_PREF_TITLE".localized(using: powerTable))
                    .fontWeight(.bold)
                    .opacity(0.8)
                Text("\(Image(systemName: batteryIcon)) \(batteryStatus): \(getBatteryLevel())%")
                    .font(.system(size: 11))
                    .foregroundStyle(.secondary)
            }
            .padding(.leading, -153)
            .padding(.top, -41)
        }
    }
    
    private func getBatteryLevel() -> Int {
        guard let snapshot = IOPSCopyPowerSourcesInfo()?.takeRetainedValue(),
              let sources: NSArray = IOPSCopyPowerSourcesList(snapshot)?.takeRetainedValue() else {
            return 100
        }
        
        for ps in sources {
            guard let info: NSDictionary = IOPSGetPowerSourceDescription(snapshot, ps as CFTypeRef)?.takeUnretainedValue() else {
                return 100
            }
            
            if let capacity = info[kIOPSCurrentCapacityKey] as? Int {
                return capacity
            }
        }
        
        return 100
    }
    
    private func isBatteryCharging() -> Bool {
        guard let snapshot = IOPSCopyPowerSourcesInfo()?.takeRetainedValue(),
              let sources = IOPSCopyPowerSourcesList(snapshot)?.takeRetainedValue() as? [CFTypeRef] else {
            return false
        }

        for ps in sources {
            if let description = IOPSGetPowerSourceDescription(snapshot, ps)?.takeUnretainedValue() as? [String: Any] {
                if let isCharging = description[kIOPSIsChargingKey as String] as? Bool {
                    return isCharging
                }
            }
        }

        return false
    }
}

#Preview {
    BatteryView()
        .frame(width: 500, height: 700)
}
