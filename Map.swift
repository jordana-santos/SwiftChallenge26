//
//  Map.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct Map: View {
    @Binding var path: [Route]
    @Binding var introPage: Int
    @State var isAnimating: Bool = false
    
    
    var body: some View {
        GeometryReader{geo in
            ZStack(){
                Background(bg: "map")
                
                VStack(){
                    //button 1
                    Button {
                        if introPage == 0 {
                            path.append(.gameIntro)
                        }
                    } label: {
                        if introPage == 0 {
                            Image("pin")
                                .resizable()
                                .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.07)
                                .offset(y: isAnimating ? -8 : 0)
                                .animation(
                                    .easeInOut(duration: 0.5)
                                    .repeatForever(autoreverses: true),
                                    value: isAnimating
                                )
                                .onAppear {
                                    isAnimating = true
                                }
                        } else {
                            Image("pin3")
                                .resizable()
                                .frame(width: geo.size.width * 0.12, height: geo.size.height * 0.07)
                        }
                    }
                    .position(
                        x: geo.size.width * 0.3,
                        y: geo.size.height * 0.065
                    )
                    
                    //button 2
                    Button {
                        if introPage == 1 {
                            path.append(.gameIntro)
                        }
                    } label: {
                        if introPage == 1 {
                            Image("pin")
                                .resizable()
                                .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.07)
                                .offset(y: isAnimating ? -8 : 0)
                                .animation(
                                    .easeInOut(duration: 0.5)
                                    .repeatForever(autoreverses: true),
                                    value: isAnimating
                                )
                                .onAppear {
                                    isAnimating = true
                                }
                        } else if introPage == 2{
                            Image("pin3")
                                .resizable()
                                .frame(width: geo.size.width * 0.12, height: geo.size.height * 0.07)
                        } else {
                            Image("pin2")
                                .resizable()
                                .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.07)
                        }
                    }
                    .position(
                        x: geo.size.width * 0.45,
                        y: geo.size.height * 0.01
                    )
                    
                    //button 3
                    Button {
                        if introPage == 2 {
                            path.append(.gameIntro)
                        }
                    } label: {
                        if introPage == 2 {
                            Image("pin")
                                .resizable()
                                .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.07)
                                .offset(y: isAnimating ? -8 : 0)
                                .animation(
                                    .easeInOut(duration: 0.5)
                                    .repeatForever(autoreverses: true),
                                    value: isAnimating
                                )
                                .onAppear {
                                    isAnimating = true
                                }
                        } else {
                            Image("pin2")
                                .resizable()
                                .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.07)
                        }
                    }
                    .position(
                        x: geo.size.width * 0.7,
                        y: geo.size.height * 0.18
                    )
                }
                .zIndex(1)
            }
            .navigationBarBackButtonHidden(true)
        }
        

    }
}
