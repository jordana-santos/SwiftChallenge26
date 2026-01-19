//
//  GameIntro.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct GameIntro: View {
    @Binding var path: [Route]
    
    var body: some View {
        Text("Welcome to the Swift Challenge 26 Game!")
            .font(.largeTitle)
            .padding()
        
        Button {
            path.append(.game3)
        } label: {
            Rectangle()
                .frame(width: 200, height: 50)
                .foregroundColor(.blue)
                .cornerRadius(10)
                .overlay(
                    Text("game")
                        .foregroundColor(.white)
                )
        }
    }
}
