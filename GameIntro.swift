//
//  GameIntro.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct GameIntro: View {
    @Binding var path: [Route]
    @Binding var introPage: Int
    
    var body: some View {
        VStack(){
            Image("green1")
                .resizable()
                .frame(width: 200, height: 150)
                .padding()
            
            if (introPage < 3) {
                Text(texts()[introPage])
                    .padding(30)
            }
            
            Button {
                if introPage == 0 {
                    path.append(.game1)
                    introPage = 1
                } else if introPage == 1 {
                    path.append(.game2)
                    introPage = 2
                } else {
                    path.append(.game3)
                    introPage = 0
                }
            } label: {
                Rectangle()
                    .frame(width: 380, height: 50)
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                    .padding(15)
                    .overlay(
                        Text("Continue")
                            .foregroundColor(.white)
                    )
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func texts() -> [String]{
        let intro1 = """
                Wow! There's so much trash in the water! This place is so beautiful, it makes me sad to see it treated like this. Can you help me clean out the way?  
                """
        
        let intro2 = """
                Look who’s over there! Olga! Let’s invite her to have lunch with Careta. There’s just one problem… there are too many boats! Can you help me stop them so I can swim through?
                """
        
        let intro3 = """
                Finally, we made it! That was a long journey, it even made me hungry. Luckily, it’s lunchtime! 
                """
        let textList: [String] = [intro1, intro2, intro3]
        return textList
    }
}
