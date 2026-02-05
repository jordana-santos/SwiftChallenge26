//
//  Boats.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SpriteKit
import SwiftUI

struct BoatsView: View {
    @State private var scene = Boats(size: CGSize())
    @State private var showButton: Bool = false
    @Binding var path: [Route]
    @State private var startGame: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            let size = CGSize(width: geometry.size.width, height: geometry.size.height)
            VStack(){
                Rectangle()
                    .frame(width: .infinity, height: 70)
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                    .overlay(
                        Text("Click on a boat to stop it and keep it from hitting the turtle.")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .padding(.horizontal)
                    )
                    .padding(.horizontal, 5)
                    
                
                ZStack(){
                    Button {
                        startGame = true
                   } label: {
                       Rectangle()
                           .frame(width: 200, height: 50)
                           .foregroundColor(.blue)
                           .cornerRadius(10)
                           .overlay(
                               Text("Start")
                                   .foregroundColor(.white)
                           )
                   }
                   .offset(x: 0, y: 300)
                    
                    if startGame {
                        SpriteView(scene: applySize(scene: scene, size: size))
                    }
                    
                    if showButton {
                        VStack(){
                            Text("Hi Olga!")
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
    
    func applySize(scene: Boats, size:CGSize) -> SKScene {
        scene.scaleMode = .resizeFill
        scene.size = size
        
        scene.completed = {
            showButton = true
        }
        
        return scene
    }
}

class Boats: SKScene {
    let turtle1 = SKSpriteNode(imageNamed: "green")
    let turtle2 = SKSpriteNode(imageNamed: "green")
    let boat1 = SKSpriteNode(imageNamed: "boat")
    let boat2 = SKSpriteNode(imageNamed: "boat")
    let boat3 = SKSpriteNode(imageNamed: "boat")
    
    let tolerance = CGFloat(40)
    var completed: (() -> Void)?
    var isGlitching = false
    var isMoving = true
    
    enum Direction {
        case left
        case right
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        turtle1.position = CGPoint(x: frame.midX, y: 50)
        turtle2.position = CGPoint(x: 310, y: frame.maxY - 50)
        boat1.position = CGPoint(x: 50, y: 200)
        boat2.position = CGPoint(x: 360, y: 350)
        boat3.position = CGPoint(x: 50, y: 500)
        
        turtle1.size = CGSize(width: 70, height: 70)
        turtle2.size = CGSize(width: 70, height: 70)
        boat1.size = CGSize(width: 120, height: 50)
        boat2.size = CGSize(width: 120, height: 50)
        boat3.size = CGSize(width: 120, height: 50)
        turtle2.zRotation = 120
        
        boat1.userData = [:]
        boat2.userData = [:]
        boat3.userData = [:]
        
        addChild(turtle1)
        addChild(turtle2)
        addChild(boat1)
        addChild(boat2)
        addChild(boat3)
        
        startLeft(node: boat1)
        startRight(node: boat2)
        startLeft(node: boat3)
        swim()
    }
    
    func swim() {
        let targetY = frame.maxY - 50
        let distance = targetY - turtle1.position.y
        let duration = TimeInterval(distance / 50)
        let move = SKAction.moveTo(y: targetY, duration: duration)
        
        turtle1.run(.sequence([.wait(forDuration: 0.5), move]))
    }
    
    func startLeft(node: SKSpriteNode) {
        let leftX  = frame.minX + node.frame.width / 2
        let rightX = frame.maxX - node.frame.width / 2
        node.userData?["direction"] = Direction.left
        
        let goingRight = true
        let targetX = goingRight ? rightX : leftX

        let move = SKAction.moveTo(x: targetX, duration: 2.5)
        move.timingMode = .linear
        
        let switchDirection = SKAction.run {
            self.startRight(node: node)
        }

        node.run(.sequence([move, switchDirection]), withKey: "wait")
    }
    
    func startRight(node: SKSpriteNode) {
        let leftX  = frame.minX + node.size.width / 2
        let targetX = leftX
        node.userData?["direction"] = Direction.right
        
        let move = SKAction.moveTo(x: targetX, duration: 2.5)
        move.timingMode = .linear

        let switchDirection = SKAction.run {
            self.startLeft(node: node)
        }

        node.run(.sequence([move, switchDirection]), withKey: "wait")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)

        let touched = nodes(at: location)
        
        if touched.contains(boat1) {
            checkMovement(node: boat1)
        }
        if touched.contains(boat2) {
            checkMovement(node: boat2)
        }
        if touched.contains(boat3) {
            checkMovement(node: boat3)
        }
    }
    
    func paused(node: SKSpriteNode) {
        node.removeAction(forKey: "wait")
        let resume = returnMovement(node: node)
        
        node.run(.sequence([.wait(forDuration: 3.0), resume]))
    }
    
    func returnMovement(node: SKSpriteNode) -> SKAction{
        return SKAction.run {
            guard let direction = node.userData?["direction"] as? Direction else { return }
            
            switch direction {
            case .left:
                self.startLeft(node: node)
            case .right:
                self.startRight(node: node)
            }
        }
    }
    
    func checkMovement(node: SKSpriteNode){
        if isMoving {
            let resume = returnMovement(node: node)
            node.run(resume)
        } else {
            paused(node: node)
        }
        isMoving.toggle()
    }
    
    func colided(){
        let boats = [boat1, boat2, boat3]
        for node in boats {
            if abs(turtle1.position.x - node.position.x) <= tolerance && abs(turtle1.position.y - node.position.y) <= tolerance {
                glitch()
                goBack()
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        colided()
        if turtle1.position.y == frame.maxY - 50 { GameCompleted() }
    }
    
    func glitch() {
        guard !isGlitching else { return }
        isGlitching = true

        let fadeOut = SKAction.fadeAlpha(to: 0.3, duration: 0.1)
        let fadeIn = SKAction.fadeAlpha(to: 1.0, duration: 0.1)
        
        let glitch = SKAction.sequence([
            SKAction.sequence([fadeOut, fadeIn]),
            .wait(forDuration: 0.2),
            .run { self.isGlitching = false }
        ])

        turtle1.run(glitch)
    }
    
    func goBack(){
        turtle1.removeAction(forKey: "goBack")

        let swimBack = SKAction.moveBy(x: 0, y: -30, duration: 0.3)
        swimBack.timingMode = .easeOut

        let resume = SKAction.run {
            self.swim()
        }

        let sequence = SKAction.sequence([
            swimBack,
            .wait(forDuration: 0.3),
            resume
        ])

        turtle1.run(sequence)
    }
    
    func GameCompleted() {
        let boats = [boat1, boat2, boat3]
        for node in boats {
            node.removeAllActions()
        }
        completed?()
    }
}



