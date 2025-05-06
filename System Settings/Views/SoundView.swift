//
//  SoundView.swift
//  System Settings
//
//  System Settings > Sound
//

import SwiftUI

struct AudioDevice: Identifiable {
    let id = UUID()
    var name: String
    var type: String
}

struct SoundView: View {
    @State private var alertSound = "Tink"
    @State private var alertVolume = 100.0
    @State private var feedbackSound = false
    @State private var hoverTask: Task<Void, Never>? = nil
    @State private var selectedDevice = "OUTPUT"
    @State private var selectedOutput = "DEFAULT_ALERT_DEVICE"
    @State private var selectedOutputDevice: AudioDevice.ID? = nil
    @State private var startupSound = true
    @State private var soundEffects = true
    let alertSounds = ["Tink", "Blow", "Pop", "Glass", "Funk", "Hero", "Frog", "Basso", "Bottle", "Purr", "Morse", "Ping", "Sosumi", "Submarine"]
    let deviceOptions = ["OUTPUT", "INPUT"]
    let devices = [
        AudioDevice(name: "Speakers", type: "Built-in")
    ]
    let outputOptions = ["DEFAULT_ALERT_DEVICE"]
    let table = "Sound"
    
    var body: some View {
        CustomForm(title: "Sound") {
            Section("SOUND_EFFECTS".localize(table: table)) {
                HStack {
                    Picker("SOUND_EFFECT".localize(table: table), selection: $alertSound) {
                        ForEach(alertSounds, id: \.self) { sound in
                            Text(sound.localize(table: "AlertSounds"))
                                .onHover { hovering in
                                    if hovering {
                                        startSoundTask(sound: sound)
                                    }
                                }
                        }
                    }
                    Button("PLAY_SOUND".localize(table: table), systemImage: "play.circle") {
                        playSound(sound: alertSound)
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(.secondary)
                    .imageScale(.large)
                    .labelStyle(.iconOnly)
                }
                
                Picker("ALERT_DEVICES".localize(table: table), selection: $selectedOutput) {
                    ForEach(outputOptions, id: \.self) { output in
                        Text(output.localize(table: table))
                    }
                }
                
                Slider(value: $alertVolume, in: 0...100, step: 15) {
                    Text("ALERT_VOLUME", tableName: table)
                } minimumValueLabel: {
                    Image(systemName: "speaker.fill")
                } maximumValueLabel: {
                    Image(systemName: "speaker.3.fill")
                }
                
                Toggle("PLAY_BOOT_CHIME".localize(table: table), isOn: $startupSound)
                Toggle("PLAY_UI_EFFECTS".localize(table: table), isOn: $soundEffects)
                Toggle("PLAY_VOLUME_KEY_FEEDBACK".localize(table: table), isOn: $feedbackSound)
            }
            
            Section("OUTPUT_INPUT".localize(table: table)) {
                Picker("", selection: $selectedDevice) {
                    ForEach(deviceOptions, id: \.self) { output in
                        Text(output.localize(table: table))
                    }
                }
                .pickerStyle(.segmented)
                .fixedSize(horizontal: false, vertical: true)
                ._safeAreaInsets(EdgeInsets(top: 0, leading: -356, bottom: 0, trailing: 0))
                
                Table(devices, selection: $selectedOutputDevice) {
                    TableColumn("Name", value: \.name)
                    TableColumn("Type", value: \.type)
                }
            }
            
            Section {
                if selectedDevice == "OUTPUT" {
                    Text("OUTPUT_VOLUME", tableName: table)
                    Text("BALANCE", tableName: table)
                } else {
                    
                }
            } footer: {
                Spacer()
                HelpButton(topicID: "mchl9777ee30")
            }
        }
    }
    
    private func startSoundTask(sound: String) {
        // Cancel any previously-existing tasks
        hoverTask?.cancel()
        
        hoverTask = Task {
            try? await Task.sleep(for: .seconds(0.5))
            if !Task.isCancelled {
                playSound(sound: sound)
            }
        }
    }
    
    private func playSound(sound: String) {
        if let sound = NSSound(contentsOf: URL(filePath: "/System/Library/Sounds/\(sound).aiff"), byReference: false) {
            sound.play()
            hoverTask?.cancel()
            hoverTask = nil
        }
    }
}



#Preview {
    SoundView()
        .frame(height: 500)
}
