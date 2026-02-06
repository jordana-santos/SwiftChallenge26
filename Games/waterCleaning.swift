//
//  waterCleaning.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 02/02/26.
//

import SpriteKit
import SwiftUI

struct WaterCleaningView: View {
    @State private var scene = waterCleaning(size: CGSize())
    @State private var showButton: Bool = false
    @Binding var path: [Route]
    
    var body: some View {
        GeometryReader { geo in
            let size = CGSize(width: geo.size.width, height: geo.size.height)
            VStack(){
                Rectangle()
                    .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.08)
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                    .overlay(
                        Text("Drag the trash out of the water and into the trash can.")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .padding(.horizontal, 10)
                    )
                    .padding(.horizontal, 5)
                    
                
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
    let can = SKSpriteNode(imageNamed: "can")
    let bag = SKSpriteNode(imageNamed: "bag")
    let straw = SKSpriteNode(imageNamed: "straw")
    let can2 = SKSpriteNode(imageNamed: "can")
    let bag2 = SKSpriteNode(imageNamed: "bag")
    let target = CGPoint(x: 350, y: 80)
    let tolerance : CGFloat = 120
    var dragging: SKSpriteNode?
    let trashCan = SKSpriteNode(imageNamed: "trash")
    var counter = CGFloat(5)
    var completed: (() -> Void)?
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        can.position  = relPos(x: 0.80, y: 0.75)
        can2.position = relPos(x: 0.4, y: 0.55)
        bag.position  = relPos(x: 0.3, y: 0.85)
        bag2.position = relPos(x: 0.20, y: 0.3)
        straw.position  = relPos(x: 0.75, y: 0.4)
        trashCan.position  = relPos(x: 0.85, y: 0.1)

        can.size  = relSize(w: 0.1, h: 0.08)
        can2.size = relSize(w: 0.1, h: 0.08)
        bag.size  = relSize(w: 0.23, h: 0.16)
        bag2.size = relSize(w: 0.23, h: 0.16)
        straw.size  = relSize(w: 0.11, h: 0.1)
        trashCan.size  = relSize(w: 0.25, h: 0.2)
        
        can2.zRotation = 120
        bag2.zRotation = 80
        
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
        
        CheckDrop(node: can)
        CheckDrop(node: can2)
        CheckDrop(node: bag)
        CheckDrop(node: bag2)
        CheckDrop(node: straw)
    }
    
    func CheckDrop(node: SKSpriteNode){
        if abs(node.position.x - target.x) <= tolerance && abs(node.position.y - target.y) <= tolerance {
            node.removeFromParent()
            counter -= 1
            node.position.x = 5000
            GameCompleted()
        }
    }
    
    func relPos(x: CGFloat, y: CGFloat) -> CGPoint {
        CGPoint(x: size.width * x, y: size.height * y)
    }

    func relSize(w: CGFloat, h: CGFloat) -> CGSize {
        CGSize(width: size.width * w, height: size.height * h)
    }

    func GameCompleted() {
        if counter == 0 {
            completed?()
        }
    }
}
