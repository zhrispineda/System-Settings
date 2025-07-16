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
    @State private var localization = LocalizationManager(bundleURL:  "/System/Library/ExtensionKit/Extensions/Sound.appex")
    @State private var alerts = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/Sound.appex", stringsFile: "AlertSounds")
    @State private var alertSound = "Tink"
    @State private var alertVolume = 100.0
    @State private var outputBalance = 50.0
    @State private var feedbackSound = false
    @State private var hoverTask: Task<Void, Never>? = nil
    @State private var inputVolume = 50.0
    @State private var outputMuted = false
    @State private var outputVolume = 100.0
    @State private var selectedDevice = "OUTPUT"
    @State private var selectedOutput = "DEFAULT_ALERT_DEVICE"
    @State private var selectedInputDevice: AudioDevice.ID? = nil
    @State private var selectedOutputDevice: AudioDevice.ID? = nil
    @State private var startupSound = true
    @State private var soundEffects = true
    let alertSounds = ["Tink", "Blow", "Pop", "Glass", "Funk", "Hero", "Frog", "Basso", "Bottle", "Purr", "Morse", "Ping", "Sosumi", "Submarine"]
    let deviceOptions = ["OUTPUT", "INPUT"]
    let inputDevices = [
        AudioDevice(name: "Microphone", type: "Built-in")
    ]
    let outputDevices = [
        AudioDevice(name: "Speakers", type: "Built-in")
    ]
    let outputOptions = ["DEFAULT_ALERT_DEVICE"]
    
    var body: some View {
        CustomForm(title: "Sound") {
            Section("SOUND_EFFECTS".localized(using: localization)) {
                HStack {
                    Picker("SOUND_EFFECT".localized(using: localization), selection: $alertSound) {
                        ForEach(alertSounds, id: \.self) { sound in
                            Text(sound.localized(using: localization))
                                .onHover { hovering in
                                    if hovering {
                                        startSoundTask(sound: sound)
                                    }
                                }
                        }
                    }
                    Button("PLAY_SOUND".localized(using: localization), systemImage: "play.circle") {
                        playSound(sound: alertSound)
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(.secondary)
                    .imageScale(.large)
                    .labelStyle(.iconOnly)
                }
                
                Picker("ALERT_DEVICES".localized(using: localization), selection: $selectedOutput) {
                    ForEach(outputOptions, id: \.self) { output in
                        Text(output.localized(using: localization))
                    }
                }
                
                Slider(value: $alertVolume, in: 0...100, step: 15) {
                    Text("ALERT_VOLUME".localized(using: localization))
                } minimumValueLabel: {
                    Image(systemName: "speaker.fill")
                } maximumValueLabel: {
                    Image(systemName: "speaker.3.fill")
                }
                
                Toggle("PLAY_BOOT_CHIME".localized(using: localization), isOn: $startupSound)
                Toggle("PLAY_UI_EFFECTS".localized(using: localization), isOn: $soundEffects)
                Toggle("PLAY_VOLUME_KEY_FEEDBACK".localized(using: localization), isOn: $feedbackSound)
            }
            
            Section("OUTPUT_INPUT".localized(using: localization)) {
                Picker("", selection: $selectedDevice) {
                    ForEach(deviceOptions, id: \.self) { output in
                        Text(output.localized(using: localization))
                    }
                }
                .pickerStyle(.segmented)
                .fixedSize(horizontal: false, vertical: true)
                ._safeAreaInsets(EdgeInsets(top: 0, leading: -356, bottom: 0, trailing: 0))
                
                if selectedDevice == "OUTPUT" {
                    Table(outputDevices, selection: $selectedOutputDevice) {
                        TableColumn("Name", value: \.name)
                            .disabledCustomizationBehavior(.resize)
                        TableColumn("Type", value: \.type)
                    }
                } else {
                    Table(inputDevices, selection: $selectedInputDevice) {
                        TableColumn("Name", value: \.name)
                        TableColumn("Type", value: \.type)
                    }
                }
            }
            
            Section {
                if selectedDevice == "OUTPUT" {
                    VStack {
                        Slider(value: $outputVolume, in: 0...100, step: 15) {
                            Text("OUTPUT_VOLUME".localized(using: localization))
                        } minimumValueLabel: {
                            Image(systemName: "speaker.fill")
                        } maximumValueLabel: {
                            Image(systemName: "speaker.3.fill")
                        }
                        
                        Toggle("OUTPUT_MUTE".localized(using: localization), isOn: $outputMuted)
                            .toggleStyle(.checkbox)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    VStack {
                        Slider(value: $outputBalance, in: 0...100, step: 50) {
                            Text("BALANCE".localized(using: localization))
                        }
                        
                        HStack {
                            Spacer()
                            Text("Left")
                            Spacer()
                            Text("Right")
                        }
                        .font(.caption)
                    }
                } else {
                    Slider(value: $inputVolume, in: 0...100, step: 15) {
                        Text("INPUT_VOLUME".localized(using: localization))
                    } minimumValueLabel: {
                        Image(systemName: "microphone.and.signal.meter.fill")
                    } maximumValueLabel: {
                        Image(systemName: "microphone.and.signal.meter.fill")
                    }
                    
                    HStack(spacing: 10) {
                        Text("INPUT_LEVEL".localized(using: localization))
                        Spacer()
                        ForEach(1...15, id: \.self) {_ in
                            Image(.levelOff)
                        }
                    }
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
        .frame(width: 500, height: 700)
}
