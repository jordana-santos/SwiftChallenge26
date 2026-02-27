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
    let text = IntroTexts()
    
    var body: some View {
        GeometryReader(){ geo in
            ZStack(){
                Background(bg: "bgGame3")
                
                VStack(){
                    if introPage == 2{
                        Image("happyGreen")
                            .resizable()
                            .frame(width: 200, height: 150)
                            .padding(30)
                    } else {
                        Image("sadGreen")
                            .resizable()
                            .frame(width: 200, height: 150)
                            .padding(30)
                    }
                    
                    ZStack(){
                        Image("bubbleBaloon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.4)
                            .offset(x: geo.size.width * 0.01, y: geo.size.height * 0.015)
                        
                        Text(text[introPage])
                            .padding(.horizontal, 30)
                            .padding(30)
                            .offset(x: geo.size.width * 0.01, y: geo.size.height * 0.015)
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                    }
                    Spacer()
                    
                    Button {
                        path.append(.game)
                    } label: {
                        Rectangle()
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.05)
                            .offset(x: geo.size.width * 0.025,y: geo.size.height * 0.2)
                            .cornerRadius(10)
                            .overlay(
                                Text(continueButton())
                                    .foregroundColor(.black)
                                    .font(.system(size: 17))
                            )
                    }
                    .padding()
                    .buttonStyle(.glass)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
