////
////  waterCleaning.swift
////  SwiftChallenge25
////
////  Created by Jordana Lourenço Santos on 19/01/26.
////
//
//import SwiftUI
//
//struct waterCleaning: View {
//    @Binding var path: [Route]
//    @State private var position: CGPoint = CGPoint(x: 82, y: 81)
//    @State private var position1: CGPoint = CGPoint(x: 100, y: 40)
//    @State private var position2: CGPoint = CGPoint(x: 50, y: 50)
// 
//    var body: some View {
//        VStack(){
//            if isShowing {
//                Image("teste")
//                    .draggable(position: $position)
//                    .frame(width: 50, height: 50)
//            }
//            if isShowing1 {
//                Image("pedra")
//                    .frame(width: 50, height: 50)
//                    .draggable(position: $position1)
//            }
//            if isShowing2 {
//                Image("porta")
//                    .frame(width: 50, height: 50)
//                    .draggable(position: $position2)
//            }
//
//            Rectangle()
//                .frame(width: 10, height: 10)
//                .foregroundColor(.gray)
//                .position(x: 100, y: 0)
//        }
//        Spacer()
//
//        Button {
//            path.append(.map)
//        } label: {
//            Rectangle()
//                .frame(width: 200, height: 50)
//                .foregroundColor(.blue)
//                .cornerRadius(10)
//                .overlay(
//                    Text("map")
//                        .foregroundColor(.white)
//                )
//        }
//    }
//}
//

import SpriteKit
import SwiftUI

struct WaterCleaningView: View {
    @State private var scene = waterCleaning(size: CGSize())
    @State private var showButton: Bool = false
    @Binding var path: [Route]
    
    var body: some View {
        GeometryReader { geometry in
            let size = CGSize(width: geometry.size.width, height: geometry.size.height)
            VStack(){
                Rectangle()
                    .frame(width: 390, height: 70)
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                    .overlay(
                        Text("Drag the trash out of the water and into the trash can.")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .padding(.horizontal)
                    )
                    
                
                ZStack(){
                    SpriteView(scene: applySize(scene: scene, size: size))
                    
                    if showButton {
                        VStack(){
                            Text("Thanks! Now I can swim freely!")
                                .foregroundColor(.black)
                            
                            Button {
                                path.append(.map)
                           } label: {
                               Rectangle()
                                   .frame(width: 200, height: 50)
                                   .foregroundColor(.blue)
                                   .cornerRadius(10)
                                   .overlay(
                                       Text("Continue")
                                           .foregroundColor(.white)
                                   )
                           }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func applySize(scene: waterCleaning, size:CGSize) -> SKScene {
        scene.scaleMode = .resizeFill
        scene.size = size
        
        scene.completed = {
            showButton = true
        }
        
        return scene
    }
}

class waterCleaning: SKScene {
    let can = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
    let bag = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
    let straw = SKSpriteNode(color: .green, size: CGSize(width: 50, height: 50))
    let can2 = SKSpriteNode(color: .orange, size: CGSize(width: 50, height: 50))
    let bag2 = SKSpriteNode(color: .yellow, size: CGSize(width: 50, height: 50))
    let target = CGPoint(x: 350, y: 80)
    let tolerance : CGFloat = 120
    var dragging: SKSpriteNode?
    let trashCan = SKSpriteNode(color: .gray, size: CGSize(width: 60, height: 80))
    var counter = CGFloat(5)
    var completed: (() -> Void)?
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        can.position = CGPoint(x: 350, y: 650)
        can2.position = CGPoint(x: 100, y: 350)
        bag.position = CGPoint(x: 150, y: 580)
        bag2.position = CGPoint(x: 80, y: 120)
        straw.position = CGPoint(x: 200, y: 200)
        trashCan.position = CGPoint(x: 360, y: 70)
        
        addChild(trashCan)
        addChild(can)
        addChild(can2)
        addChild(bag)
        addChild(bag2)
        addChild(straw)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        dragging = nodes(at: location)
            .compactMap { $0 as? SKSpriteNode }
            .first
        
        if dragging == trashCan {
            dragging = nil
        }
     
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let box = dragging else { return }
        
        box.position = touch.location(in: self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dragging = nil
        
        if abs(can.position.x - target.x) <= tolerance && abs(can.position.y - target.y) <= tolerance {
            can.removeFromParent()
            counter -= 1
            can.position.x = 1000
            GameCompleted()
        }
        
        if abs(can2.position.x - target.x) <= tolerance && abs(can2.position.y - target.y) <= tolerance {
            can2.removeFromParent()
            counter -= 1
            can2.position.x = 1000
            GameCompleted()
        }
        
        if abs(bag.position.x - target.x) <= tolerance && abs(bag.position.y - target.y) <= tolerance {
            bag.removeFromParent()
            counter -= 1
            bag.position.x = 1000
            GameCompleted()
        }
        
        if abs(bag2.position.x - target.x) <= tolerance && abs(bag2.position.y - target.y) <= tolerance {
            bag2.removeFromParent()
            counter -= 1
            bag2.position.x = 1000
            GameCompleted()
        }
        
        if abs(straw.position.x - target.x) <= tolerance && abs(straw.position.y - target.y) <= tolerance {
            straw.removeFromParent()
            counter -= 1
            straw.position.x = 1000
            GameCompleted()
        }
        
        
    }
    
    func GameCompleted() {
        if counter == 0 {
            completed?()
        }
    }
}
