//
//  Settings.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 13/02/26.
//
// barra de volume (slider)
// barra de fonte
// língua


import SwiftUI

struct SettingsPage: View {
    @State private var volumeLevel: Double = 2
    static var shared = SettingsPage()
    var language: String = "en"
    
    var body: some View {
        GeometryReader() { geo in
            VStack(){
                Text("Settings")
                    .padding()
                
                Slider(value: $volumeLevel, in: 0...3, step: 1)
                    .padding()
                
                Button {
                    SettingsPage.shared.language = "pt"
                } label: {
                    Text("pt-br")
                }
                
            }
        }
        .onChange(of: volumeLevel) {
            Soundtrack.shared.changeVolume(volume: Int(volumeLevel))
        }
    }
}
