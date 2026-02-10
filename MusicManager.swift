//
//  MusicManager.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 10/02/26.
//
import SwiftUI
import AVFoundation

class MusicManager: ObservableObject{
    @MainActor static let shared = MusicManager()
    var player: AVAudioPlayer?
    
    private init() {}
    
    func playMusic() {
        guard let path = Bundle.main.path(forResource: "turtlesIntro", ofType: "m4a") else {
            print("Background music file not found!")
            return
        }
        do {
            let url = URL(fileURLWithPath: path)
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 0.2
            player?.numberOfLoops = -1  // Infinite looping
            player?.play()

            // Enable background playback
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error loading background music: \(error.localizedDescription)")
        }
    }
    
    func stopMusic() {
        player?.stop()
    }
}



