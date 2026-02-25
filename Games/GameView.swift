//
//  GameView.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 13/02/26.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    @State private var scene1 = waterCleaning(size: CGSize())
    @State private var scene2 = Boats(size: CGSize())
    @State private var scene3 = lunchTime(size: CGSize())
    @State private var showButton: Bool = false
    @Binding var path: [Route]
    @Binding var introPage: Int
    @State private var startGame: Bool = false
    let text1 = GameTexts()
    let text2 = EndGameTexts()
    
    var body: some View {
        GeometryReader { geo in
            let size = CGSize(width: geo.size.width, height: geo.size.height)
            let bg = ["bgGame1", "bgGame2", "bgGame3"]
            ZStack(){
                Background(bg: bg[introPage])
                
                VStack(){
                    Rectangle()
                        .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.08)
                        .foregroundColor(Color("whiteBlue"))
                    //f1fdfc
                        .cornerRadius(10)
                        .overlay(
                            Text(text1[introPage])
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                                .padding(.horizontal, 10)
                                .font(.system(size: 17))
                                .padding(5)
                        )
                        .padding(.horizontal, 5)
                    
                    Spacer()
                    ZStack(){
                        if introPage == 0 {
                            SpriteView(scene: applyGame1(scene: scene1, size: size), options: .allowsTransparency)
                        } else if introPage == 1 {
                            if !startGame {
                                VStack(){
                                    Image("click")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 200, height: 150)
                                        .offset(x: geo.size.width * 0.01,y: geo.size.height * 0.35)

                                    Spacer()
                                    
                                    Button {
                                        startGame = true
                                    } label: {
                                        Rectangle()
                                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.05)
                                            .offset(x: geo.size.width * 0.025,y: geo.size.height * 0.3)
                                            .cornerRadius(10)
                                            .overlay(Text("Start"))
                                    }
                                    .padding()
                                    .buttonStyle(.glass)
                                }
                            }
                            if startGame {
                                SpriteView(scene: applyGame2(scene: scene2,size: size), options: .allowsTransparency)
                            }
                        } else {
                            SpriteView(scene: applyGame3(scene: scene3,size: size), options: .allowsTransparency)
                        }
                        
                        if showButton {
                            VStack(){
                                ZStack(){
                                    Image("smallBubbleBaloon")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geo.size.width * 0.6, height: geo.size.height * 0.2)
                                        .offset(x: geo.size.width * 0.01, y: geo.size.height * 0.25)
                                    
                                    Text(text2[introPage])
                                        .foregroundColor(.black)
                                        .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.1)
                                        .offset(x: geo.size.width * 0.01, y: geo.size.height * 0.25)
                                        .font(.system(size: 17))
                                }
                                
                                Spacer()
                                Button {
                                    if introPage == 0 {
                                        path.append(.map)
                                        introPage = 1
                                    } else if introPage == 1 {
                                        path.append(.map)
                                        introPage = 2
                                    } else if introPage == 2 {
                                        path.append(.final)
                                        introPage = 0
                                    }
                                } label: {
                                    Rectangle()
                                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.05)
                                        .offset(x: geo.size.width * 0.025,y: geo.size.height * 0.2)
                                        .cornerRadius(10)
                                        .overlay(Text(continueButton()))
                                }
                                .padding()
                                .buttonStyle(.glass)
                            }
                        }
                    }
                }
                .zIndex(1)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func applyGame1(scene: waterCleaning, size:CGSize) -> SKScene {
        scene.scaleMode = .resizeFill
        scene.size = size
        scene.completed = {showButton = true }
        
        return scene
    }
    
    func applyGame2(scene: Boats, size:CGSize) -> SKScene {
        scene.scaleMode = .resizeFill
        scene.size = size
        scene.completed = {showButton = true }
        
        return scene
    }
    
    func applyGame3(scene: lunchTime, size:CGSize) -> SKScene {
        scene.scaleMode = .resizeFill
        scene.size = size
        scene.completed = {showButton = true }
        
        return scene
    }
}
