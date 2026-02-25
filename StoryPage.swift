//
//  StoryPage.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct StoryPage: View {
    @Binding var path: [Route]
    @State var currentPage: Int = 0
    let text = StoryTexts()
    
    var body: some View {

        GeometryReader(){ geo in
            ZStack(){
                if currentPage == 2 || currentPage == 3 {
                    Background(bg: "bgStory2")
                } else {
                    Background(bg: "bgStory")
                }
                
                VStack(){
                    if currentPage == 2 || currentPage == 3 {
                        Image("caretta")
                            .resizable()
                            .frame(width: 200, height: 150)
                            .padding(30)
                    } else {
                        Image("happyGreen")
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
                        
                        if (currentPage < 5) {
                            Text(text[currentPage])
                                .padding(.horizontal, 30)
                                .padding(30)
                                .offset(x: geo.size.width * 0.01, y: geo.size.height * 0.015)
                                .font(.system(size: 17))
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        currentPage += 1
                        if currentPage == 5 {
                            currentPage = 0
                            path.append(.map)
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
                .zIndex(1)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
