//
//  waterCleaning.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct waterCleaning: View {
    @Binding var path: [Route]
    @State private var position: CGPoint = CGPoint(x: 82, y: 81)
    @State private var position1: CGPoint = CGPoint(x: 100, y: 40)
    @State private var position2: CGPoint = CGPoint(x: 50, y: 50)
    @State var target = CGPoint(x: 130, y: 0)
    @State var tolerance: CGFloat = 10
    
    var reachedTarget: Bool {
        abs(position.x - target.x) < tolerance && abs(position.y - target.y) < tolerance
    }
 
    var body: some View {
        VStack(){
            if !reachedTarget {
                Image("teste")
                    .draggable(position: $position)
                    .frame(width: 50, height: 50)
            }
            
            Image("pedra")
                .frame(width: 50, height: 50)
                .draggable(position: $position1)
            
            Image("porta")
                .frame(width: 50, height: 50)
                .draggable(position: $position2)
            
            Rectangle()
                .frame(width: 10, height: 10)
                .foregroundColor(.gray)
                .offset(x: 130, y: 0)
        }
        .navigationTitle(Text("Water Cleaning"))
        Spacer()
        
       
        
        
        
        Button {
            path.append(.map)
        } label: {
            Rectangle()
                .frame(width: 200, height: 50)
                .foregroundColor(.blue)
                .cornerRadius(10)
                .overlay(
                    Text("map")
                        .foregroundColor(.white)
                )
        }
    }
}

