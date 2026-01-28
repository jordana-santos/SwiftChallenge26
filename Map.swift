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
    
    
    var body: some View {
        ZStack(){
            Image("map2")
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
                        Rectangle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                            
                    } else {
                        Rectangle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .cornerRadius(10)
                    }
                }
                .offset(x: -60, y: -270)
                
                Button {
                    if introPage == 1 {
                        path.append(.gameIntro)
                    }
                } label: {
                    if introPage == 1 {
                        Rectangle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                    } else {
                        Rectangle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .cornerRadius(10)
                    }
                }
                .offset(x: -50, y: -100)
                
                Button {
                    if introPage == 2 {
                        path.append(.gameIntro)
                    }
                } label: {
                    if introPage == 2 {
                        Rectangle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                    } else {
                        Rectangle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .cornerRadius(10)
                    }
                }
                .offset(x: 50, y: 180)
            }
            .zIndex(1)
        }
        .navigationBarBackButtonHidden(true)
    }
}
