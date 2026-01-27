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
        VStack(){
            Button {
                if introPage == 0 {
                    path.append(.gameIntro)
                }
            } label: {
                if introPage == 0 {
                    Rectangle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .overlay(
                            Text("game 1")
                                .foregroundColor(.white)
                        )
                } else {
                    Rectangle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                        .overlay(
                            Text("game 1")
                                .foregroundColor(.white)
                        )
                }
                
            }
            
            Button {
                if introPage == 1 {
                    path.append(.gameIntro)
                }
            } label: {
                if introPage == 1 {
                    Rectangle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .overlay(
                            Text("game 2")
                                .foregroundColor(.white)
                        )
                } else {
                    Rectangle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                        .overlay(
                            Text("game 2")
                                .foregroundColor(.white)
                        )
                }
                
            }
            
            Button {
                if introPage == 2 {
                    path.append(.gameIntro)
                }
            } label: {
                if introPage == 2 {
                    Rectangle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .overlay(
                            Text("game 3")
                                .foregroundColor(.white)
                        )
                } else {
                    Rectangle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                        .overlay(
                            Text("game 3")
                                .foregroundColor(.white)
                        )
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
