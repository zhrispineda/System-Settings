//
//  SoundView.swift
//  System Settings
//
//  System Settings > Sound
//

import SwiftUI

struct SoundView: View {
    @State private var alertSound = "Tink"
    @State private var hoverTask: Task<Void, Never>? = nil
    let alertSounds = ["Tink", "Blow", "Pop", "Glass", "Funk", "Hero", "Frog", "Basso", "Bottle", "Purr", "Morse", "Ping", "Sosumi", "Submarine"]

    var body: some View {
        CustomForm(title: "Sound") {
            Section("SOUND_EFFECTS") {
                HStack {
                    Picker("SOUND_EFFECT", selection: $alertSound) {
                        ForEach(alertSounds, id: \.self) { sound in
                            Text(sound)
                                .onHover { hovering in
                                    if hovering {
                                        startSoundTask(sound: sound)
                                    }
                                }
                        }
                    }
                    Button("PLAY_SOUND", systemImage: "play.circle") {
                        playSound(sound: alertSound)
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(.secondary)
                    .imageScale(.large)
                    .labelStyle(.iconOnly)
                }
                
                Text("ALERT_DEVICES")
                
                Text("ALERT_VOLUME")
                
                Text("PLAY_BOOT_CHIME")
                
                Text("PLAY_VOLUME_KEY_FEEDBACK")
            }
            
            Section("OUTPUT_INPUT") {
                
            }
            
            Section {
                Text("OUTPUT_VOLUME")
                
                Text("BALANCE")
            } footer: {
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
}
