//
//  MusicManager.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 10/02/26.
//
import SwiftUI
import AVFoundation

class Soundtrack: ObservableObject{
    @MainActor static let shared = Soundtrack()
    var player: AVAudioPlayer?
    
    private init() {}
    
    public func playMusic() {
        guard let path = Bundle.main.path(forResource: "turtlesIntro", ofType: "m4a") else {
            print("Soundtrack file not found!")
            return
        }
        do {
            let url = URL(fileURLWithPath: path)
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.play()

            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error loading soundtrack: \(error.localizedDescription)")
        }
        
    }
    
    public func setVolume(volume: Float){
        player?.volume = volume
    }
    
    public func changeVolume(volume: Int) {
        switch volume {
            case 0:
                player?.stop()
                player?.volume = 0
            case 1:
                player?.play()
                player?.volume = 0.3
            case 2:
                player?.play()
                player?.volume = 0.6
            case 3:
                player?.play()
                player?.volume = 0.9
            default:
                player?.play()
        }
    }
}



