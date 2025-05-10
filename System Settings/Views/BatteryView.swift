//
//  BatteryView.swift
//  System Settings
//
//  System Settings > Battery
//

import SwiftUI

struct BatteryView: View {
    @State private var selectedBattery = "Automatic"
    @State private var selectedPower = "Automatic"
    let powerOptions = ["Low Power", "Automatic", "High Power"]
    
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
                    Text("ENERGY_MODE_AUTO_TEXT")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                VStack(alignment: .leading) {
                    Picker("On power adapter", selection: $selectedBattery) {
                        ForEach(powerOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                    Text("ENERGY_MODE_AUTO_TEXT")
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
}
