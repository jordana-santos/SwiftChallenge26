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
    @State var isZooming: Bool = true
    @State private var scale: CGFloat = 1.0
    @State private var imageIndex = 0
    @State private var opacity = 1.0
    
    var body: some View {
        GeometryReader{geo in
            ZStack(){
                if introPage == 0 {
                    Background(bg: "map")
                } else if introPage == 1 {
                    Background(bg: "map2")
                } else if introPage == 2 {
                    Background(bg: "map3")
                }
                
                
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
                        x: geo.size.width * 0.35,
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
                        x: geo.size.width * 0.5,
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
                        x: geo.size.width * 0.75,
                        y: geo.size.height * 0.15
                    )
                }
                
//                let images: [String] = ["BrazilMap", "EsMap", "vitoriaMap"]
//                Background(bg: images[imageIndex])
//                    .scaleEffect(scale, anchor: .topLeading)
//                    .opacity(opacity)
//                    .onAppear {
//                        zoomThenNext()
//                    }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func zoomThenNext() {
        withAnimation(.easeInOut(duration: 2)) {
            scale = 2
        }

        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if imageIndex < 3 {
                imageIndex += 1
                scale = 1.0

                zoomThenNext()
            } else {
                withAnimation(.easeOut(duration: 2)) {
                    opacity = 0
                }
            }
            
        }
    }
    
}
