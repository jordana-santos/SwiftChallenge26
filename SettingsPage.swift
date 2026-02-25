//
//  Settings.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 13/02/26.
//


import SwiftUI

struct SettingsPage: View {
    @AppStorage("volumeLevel") var volumeLevel = 2.0
    static var shared = SettingsPage()
    //@State var isPortuguese = false
    @AppStorage("isPortuguese") var isPortuguese = false
    //@AppStorage("isFlagged") var isFlagged = false
    
    var body: some View {
        GeometryReader() { geo in
            ZStack(){
                Background(bg: "bgGame3")
                
                VStack(){
                    Slider(value: $volumeLevel, in: 0...3, step: 1)
                        .padding(30)

                    Toggle(isOn: $isPortuguese) { Text(checkLanguage()[0]) }
                        .toggleStyle(.switch)
                        .padding(30)
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
        if SettingsPage.shared.isPortuguese {
            return ["Português", "Configurações"]
        } else {
            return ["Portuguese", "Settings"]
        }
    }
}
