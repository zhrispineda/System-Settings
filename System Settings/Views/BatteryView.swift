//
//  BatteryView.swift
//  System Settings
//
//  System Settings > Battery
//

import SwiftUI
import Charts

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
    @State private var selectedBattery = "ENERGY_MODE_AUTO"
    @State private var selectedPower = "ENERGY_MODE_AUTO"
    @State private var selectedTimeframe = "HOURLY_GRAPH_TITLE_FMT"
    let powerOptions = ["ENERGY_MODE_ECO", "ENERGY_MODE_AUTO", "ENERGY_MODE_PRO"]
    let powerTable = "PowerPreferences"
    let timeframeOptions = ["HOURLY_GRAPH_TITLE_FMT", "DAILY_GRAPH_TITLE_FMT"]
    let table = "BatteryUI"
    private var onBatteryText: String {
        switch selectedBattery {
        case "ENERGY_MODE_ECO":
            return "ENERGY_MODE_ECO_TEXT"
        case "ENERGY_MODE_PRO":
            return "ENERGY_MODE_PRO_TEXT".localize(table: "BatteryUI-J316")
        default:
            return "ENERGY_MODE_AUTO_TEXT"
        }
    }
    private var onPowerText: String {
        switch selectedPower {
        case "ENERGY_MODE_PRO":
            return "ENERGY_MODE_PRO_TEXT".localize(table: "BatteryUI-J316")
        case "ENERGY_MODE_ECO":
            return "ENERGY_MODE_ECO_ADAPTER_TEXT"
        default:
            return "ENERGY_MODE_AUTO_TEXT"
        }
    }
    
    var body: some View {
        CustomForm(title: "BATTERY_PREF_TITLE".localize(table: powerTable)) {
            Section {
                // Battery Health
                HStack {
                    LabeledContent("BATT_HEALTH_TITLE".localize(table: table), value: "BATT_HEALTH_CONDITION_NORMAL".localize(table: table))
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
                    Picker("On battery".localize(table: powerTable), selection: $selectedBattery) {
                        ForEach(powerOptions, id: \.self) { option in
                            Text(option.localize(table: powerOptions[2] == option ? "BatteryUI-J316" : table))
                        }
                    }
                    Text(onBatteryText.localize(table: table))
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                VStack(alignment: .leading) {
                    Picker("On power adapter".localize(table: powerTable), selection: $selectedPower) {
                        ForEach(powerOptions, id: \.self) { option in
                            Text(option.localize(table: powerOptions[2] == option ? "BatteryUI-J316" : table))
                        }
                    }
                    Text(onPowerText.localize(table: table))
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            } header: {
                VStack(alignment: .leading) {
                    Text("Energy Mode", tableName: powerTable)
                    Text("Your Mac can optimize either its battery usage with Low Power Mode, or its performance in resource-intensive tasks with High Power Mode.", tableName: powerTable)
                        .font(.callout)
                        .fontWeight(.regular)
                        .foregroundStyle(.secondary)
                }
            }
            
            // Battery usage
            Section {
                Picker("", selection: $selectedTimeframe) {
                    ForEach(timeframeOptions, id: \.self) { timeframe in
                        Text(timeframe.localize(table: table, timeframe == timeframeOptions[0] ? "24" : "10"))
                    }
                }
                .pickerStyle(.segmented)
                .fixedSize(horizontal: false, vertical: true)
                ._safeAreaInsets(EdgeInsets(top: 0, leading: -356, bottom: 0, trailing: 0))
                
                VStack(alignment: .leading) {
                    Text("LAST_CHARGED_TO_FMT".localize(table: table, "100%"))
                    Text("Today, 9:41 AM")
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundStyle(.secondary)
                }
                
                VStack(alignment: .leading) {
                    Text("BATTERY_LEVEL_GRAPH_TITLE", tableName: table)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    BatteryChart()
                        .frame(height: 110)
                        .padding(.top, -5)
                }
            } footer: {
                Spacer()
                Button("Options…".localize(table: powerTable)) {}
                HelpButton(topicID: "mchlfc3b7879")
            }
        }
    }
}

#Preview {
    BatteryView()
        .frame(width: 500, height: 700)
}
