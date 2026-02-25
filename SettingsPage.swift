//
//  Settings.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 13/02/26.
//


import SwiftUI

struct SettingsPage: View {
    @AppStorage("volumeLevel") var volumeLevel: Double = 2.0
    static var shared = SettingsPage()
    var isPortuguese: Bool = false
    @AppStorage("isFlagged") private var isFlagged = false
    
    var body: some View {
        GeometryReader() { geo in
            ZStack(){
                Background(bg: "bgGame3")
                
                VStack(){
                    Slider(value: $volumeLevel, in: 0...3, step: 1)
                        .padding(30)

                    Toggle(isOn: $isFlagged) { Label(checkLanguage()[0], systemImage: "") }
                        .toggleStyle(.switch)
                        .padding(30)
                        .onChange(of: isFlagged) {
                            SettingsPage.shared.isPortuguese.toggle()
                        }
                    Spacer()
                }
            }
        }
        .navigationTitle(checkLanguage()[1])
        .onChange(of: volumeLevel) {
            Soundtrack.shared.changeVolume(volume: Int(volumeLevel))
        }
    }
    
    func checkLanguage() -> [String]{
        if SettingsPage.shared.isPortuguese == true {
            return ["Portuguese", "Settings"]
        } else {
            return ["Português", "Configurações"]
        }
    }
}
