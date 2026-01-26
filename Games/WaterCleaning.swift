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
//    @State private var isShowing: Bool = true
//    @State private var isShowing1: Bool = true
//    @State private var isShowing2: Bool = true
// 
//    var body: some View {
//        VStack(){
//            if isShowing {
//                Image("teste")
//                    .draggable(position: $position, isShowing: $isShowing)
//                    .frame(width: 50, height: 50)
//            }
//            if isShowing1 {
//                Image("pedra")
//                    .frame(width: 50, height: 50)
//                    .draggable(position: $position1, isShowing: $isShowing1)
//            }
//            if isShowing2 {
//                Image("porta")
//                    .frame(width: 50, height: 50)
//                    .draggable(position: $position2, isShowing: $isShowing2)
//            }
//
//            Rectangle()
//                .frame(width: 10, height: 10)
//                .foregroundColor(.gray)
//                .position(x: 100, y: 0)
//        }
//        .navigationTitle(Text("Water Cleaning"))
//        Spacer()
//        
//       
//        
//        
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
    @State private var scene: SKScene = waterCleaning(size: CGSize())
    
    var body: some View {
        GeometryReader { geometry in
            let size = CGSize(width: geometry.size.width, height: geometry.size.height)
            VStack {
                //let waterCleaning = scene
                
                SpriteView(scene: applySize(scene: scene, size: size))
                   // .frame(width: 900, height: 900)
                
            }
        }
        
    }
    
    func applySize(scene: SKScene, size:CGSize) -> SKScene {
        scene.scaleMode = .resizeFill
        scene.size = size
        
        return scene
    }
}

class waterCleaning: SKScene {
    let can = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
    let bag = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
    let straw = SKSpriteNode(color: .green, size: CGSize(width: 50, height: 50))
    let target = CGPoint(x: 350, y: 80)
    let tolerance : CGFloat = 120
    var dragging: SKSpriteNode?
    let trashCan = SKSpriteNode(color: .gray, size: CGSize(width: 60, height: 80))
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        can.position = CGPoint(x: 350, y: 700)
        bag.position = CGPoint(x: 150, y: 400)
//        straw.anchorPoint = CGPoint(x: 0, y: 0)
        straw.position = CGPoint(x: 200, y: 200)
        trashCan.position = CGPoint(x: 350, y: 80)
        
        addChild(trashCan)
        addChild(can)
        addChild(bag)
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
        }
        
        if abs(bag.position.x - target.x) <= tolerance && abs(bag.position.y - target.y) <= tolerance {
            bag.removeFromParent()
        }
        
        if abs(straw.position.x - target.x) <= tolerance && abs(straw.position.y - target.y) <= tolerance {
            straw.removeFromParent()
        }
    }
}
