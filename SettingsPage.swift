//
//  Settings.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 13/02/26.
//

import SwiftUI

struct SettingsPage: View {
    var body: some View {
        Text("Settings")
        Button{
            Soundtrack.shared.stopMusic()
        } label: {
            Rectangle()
                .frame(width: 200, height: 50)
                .overlay(
                    Text("Stop Music")
                )
                .padding(10)
        }
    }
}
