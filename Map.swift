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
    @State private var scales = [1.0, 1.0, 1.0, 1.0]
    @State private var opacities = [1.0, 1.0, 1.0, 1.0]
    @State private var currentLayer = 0
    let images: [String] = ["BrazilMap", "ESMap", "VitoriaMap"]
    
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
                if introPage == 0 {
                    ForEach((0..<3).reversed(), id: \.self) { i in
                        Background(bg: images[i])
                            .scaleEffect(scales[i], anchor:  UnitPoint(x: 0.7, y: 0.6))
                            .opacity(opacities[i])
                    }
                    .onAppear(){
                        animateLayers()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func animateLayers() {
        guard currentLayer < 3 else { return }

        withAnimation(.easeInOut(duration: 6)) {
            scales[currentLayer] = 2
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            withAnimation(.easeOut(duration: 3)) {
                opacities[currentLayer] = 0
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            currentLayer += 1
            animateLayers()
        }
    }
    
}
