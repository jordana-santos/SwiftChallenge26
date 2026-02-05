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
        ZStack(){
            Image("map")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack(){
                Button {
                    if introPage == 0 {
                        path.append(.gameIntro)
                    }
                } label: {
                    if introPage == 0 {
                        Image("pin")
                            .resizable()
                            .frame(width: 40, height: 55)
                            .offset(y: isAnimating ? -6 : 0)
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
                            .frame(width: 40, height: 55)
                    }
                }
                .offset(x: -60, y: -260)
                
                Button {
                    if introPage == 1 {
                        path.append(.gameIntro)
                    }
                } label: {
                    if introPage == 1 {
                        Image("pin")
                            .resizable()
                            .frame(width: 40, height: 55)
                            .offset(y: isAnimating ? -6 : 0)
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
                            .frame(width: 40, height: 55)
                    }
                }
                .offset(x: -20, y: -90)
                
                Button {
                    if introPage == 2 {
                        path.append(.gameIntro)
                    }
                } label: {
                    if introPage == 2 {
                        Image("pin")
                            .resizable()
                            .frame(width: 40, height: 55)
                            .offset(y: isAnimating ? -6 : 0)
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
                            .frame(width: 40, height: 55)
                    }
                }
                .offset(x: 70, y: 220)
            }
            .zIndex(1)
        }
        .navigationBarBackButtonHidden(true)
    }
}
