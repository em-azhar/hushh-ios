//
//  ContentView.swift
//  hushh-ios
//
//  Created by Azhar Ali on 06/11/2024.
//

import SwiftUI
import AVFoundation

struct ContentView: View {    
    @EnvironmentObject var themeManager: ThemeManager
    
    let sounds = [
        "white",
        "pink",
        "rain 1",
        "rain 2",
        "fire",
        "ocean 1",
        "ocean 2"
    ]
    @State private var selectedSound = "white"
    @State private var isPlaying = false
    @State var audioPlayer: AVAudioPlayer?
    @State var volumePercentage: Double = 100.0
    
    @State var isThemeOptionsShowing: Bool = false
    @State var themeName: String
    
    let themeMapping: [String : Theme] = [
        "light": .light,
        "dark": .dark,
        "greenOnBlack": .greenOnBlack,
        "earthy": .earthy,
        "blueWhite": .blueWhite,
        "mutedPastel": .mutedPastel,
        "sunset": .sunset
    ]
    
    var body: some View {
        // TODO: replace themeManager.currentTheme with theme
        let currentTheme = themeManager.currentTheme
            VStack (alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("hushh")
                            .font(
                                .system(
                                    size: 40,
                                    weight: .semibold,
                                    design: .monospaced
                                )
                            )
                            .foregroundStyle(currentTheme.primaryColor)
                        Text("noise maker.")
                            .font(
                                .system(
                                    size: 20,
                                    weight: .medium,
                                    design: .monospaced
                                )
                            )
                            .foregroundStyle(
                                currentTheme.textColor
                            )
                    }
                    Spacer()
                    Image(systemName: "paintpalette.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(currentTheme.secondaryColor)
                        .padding(.top, 12)
                        .padding(.trailing, 10)
                        .onTapGesture {
                            isThemeOptionsShowing = true
                        }
                        .sheet(
                            isPresented: $isThemeOptionsShowing,
                            onDismiss: {
                                themeManager
                                    .setTheme(themeMapping[themeName] ?? .light)
                            }
                        ) {
                            ThemePickerView(themeName: $themeName)
                        }
                    VStack {
                        Button(action: {
                            if !isPlaying {
                                soundInit(selectedSound)
                            }
                            playHandler(isPlayPauseButtonPressed: true)
                            isPlaying.toggle()
                        }) {
                            !isPlaying ? Image(systemName: "play.circle.fill")
                                .font(.system(size: 35))
                                .foregroundStyle(
                                    currentTheme.secondaryColor
                                ) :
                            Image(systemName: "pause.circle.fill")
                                .font(.system(size: 35))
                                .foregroundStyle(
                                    currentTheme.secondaryColor
                                )
                        }
                        Text(!isPlaying ? "off" : "on")
                            .font(
                                .system(
                                    size: 20,
                                    weight: .light,
                                    design: .monospaced
                                )
                            )
                            .foregroundStyle(
                                currentTheme.textColor
                            )
                    }
                    .padding(.top, 10)
                }
                Divider()
                    .padding(.vertical)
                    .foregroundStyle(currentTheme.dividerColor)
                VStack(alignment: .leading) {
                    Text("Noise type")
                        .font(
                            .system(
                                size: 28,
                                weight: .semibold,
                                design: .monospaced
                            )
                        )
                        .foregroundStyle(currentTheme.primaryColor)
                    List(sounds, id:\.self) { sound in
                        HStack {
                            Text(sound)
                                .font(.system(size: 20, design: .monospaced))
                            Spacer()
                            ZStack {
                                Circle()
                                    .strokeBorder(
                                        currentTheme.primaryColor,
                                        lineWidth: 1.5
                                    )
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(
                                        currentTheme.backgroundColor
                                    )
                                if selectedSound == sound {
                                    Circle()
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(
                                            currentTheme
                                                .secondaryColor)
                                }
                            }
                        }
                        .foregroundStyle(currentTheme.textColor)
                        .listRowBackground(
                            currentTheme.backgroundColor
                        )
                        .onTapGesture {
                            selectedSound = sound
                            if isPlaying {
                                soundInit(selectedSound)
                                playHandler(isPlayPauseButtonPressed: false)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                    .listStyle(PlainListStyle())
                }
                VStack (alignment: .leading){
                    Text(String(format: "Volume %.f%%", volumePercentage))
                        .font(.system(size: 28, weight: .medium, design: .monospaced))
                        .foregroundStyle(currentTheme.primaryColor)
                    Slider(
                        value: $volumePercentage,
                        in: 0...100,
                        step: 1
                    )
                    .tint(currentTheme.secondaryColor)
                    .onChange(of: volumePercentage, initial: true) {
                        audioPlayer?.volume = Float(volumePercentage/100)
                    }
                    .padding(.top, -10)
                }
                .padding(.top)
                
                Spacer()
            }
            .padding()
            .background(currentTheme.backgroundColor)
    }
    
    func soundInit(_ soundName: String ) {
        guard let soundURL = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("Sound file not found.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func playHandler(isPlayPauseButtonPressed: Bool) {
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.volume = Float(volumePercentage/100)
        
        if isPlayPauseButtonPressed {
            if isPlaying {
                audioPlayer.stop()
            } else {
                audioPlayer.play()
            }
        } else {
            audioPlayer.play()
        }
    }
}

#Preview {
    ContentView(themeName: "light")
        .environmentObject(ThemeManager())
}
