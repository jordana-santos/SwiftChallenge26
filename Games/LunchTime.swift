//
//  LunchTime.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SpriteKit
import SwiftUI

struct LunchTimeView: View {
    @State private var scene = lunchTime(size: CGSize())
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
                        Text("Drag each turtle species to its favorite type of food.")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .padding(.horizontal)
                    )
 
                ZStack(){
                    SpriteView(scene: applySize(scene: scene, size: size))
                    
                    if showButton {
                        VStack(){
                            Text("Yummy!")
                                .foregroundColor(.black)
                            
                            Button {
                                path.append(.final)
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
    
    func applySize(scene: lunchTime, size:CGSize) -> SKScene {
        scene.scaleMode = .resizeFill
        scene.size = size
        
        scene.completed = {
            showButton = true
        }
        
        return scene
    }
}

class lunchTime: SKScene {
    let turtle1 = SKSpriteNode(imageNamed: "green")
    let turtle2 = SKSpriteNode(imageNamed: "loggerhead")
    let turtle3 = SKSpriteNode(imageNamed: "green")
    let algae1 = SKSpriteNode(color: .systemGreen, size: CGSize(width: 30, height: 40))
    let algae2 = SKSpriteNode(color: .systemGreen, size: CGSize(width: 30, height: 40))
    let algae3 = SKSpriteNode(color: .systemGreen, size: CGSize(width: 30, height: 40))
    let crustaceans1 = SKSpriteNode(color: .systemBlue, size: CGSize(width: 30, height: 40))
    let crustaceans2 = SKSpriteNode(color: .systemBlue, size: CGSize(width: 30, height: 40))
    
    let target = CGPoint(x: 350, y: 80)
    let tolerance : CGFloat = 50
    var dragging: SKSpriteNode?
    var counter = CGFloat(5)
    var completed: (() -> Void)?
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        turtle1.position = CGPoint(x: 100, y: 150)
        turtle2.position = CGPoint(x: 220, y: 100)
        turtle3.position = CGPoint(x: 300, y: 130)
        turtle1.size = CGSize(width: 70, height: 70)
        turtle2.size = CGSize(width: 60, height: 75)
        turtle3.size = CGSize(width: 70, height: 70)
        
        algae1.position = CGPoint(x: 80, y: 300)
        algae2.position = CGPoint(x: 200, y: 350)
        algae3.position = CGPoint(x: 100, y: 590)
        crustaceans1.position = CGPoint(x: 250, y: 500)
        crustaceans2.position = CGPoint(x: 300, y: 600)
        
        addChild(turtle1)
        addChild(turtle2)
        addChild(turtle3)
        addChild(algae1)
        addChild(algae2)
        addChild(algae3)
        addChild(crustaceans1)
        addChild(crustaceans2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let food = [algae1, algae2, algae3, crustaceans1, crustaceans2]
        
        dragging = nodes(at: location)
            .compactMap { $0 as? SKSpriteNode }
            .first
        
        if let dragging, food.contains(dragging) {
            self.dragging = nil
        }
     
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let box = dragging else { return }
        
        box.position = touch.location(in: self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dragging = nil
        let greenTarget = [algae1, algae2, algae3]
        let loggerheadTarget = [crustaceans1, crustaceans2]
        
        for target in greenTarget {
            if abs(turtle1.position.x - target.position.x) <= tolerance &&
                   abs(turtle1.position.y - target.position.y) <= tolerance {
                target.removeFromParent()
                counter -= 1
                target.position.x = 1000
                GameCompleted()
            }
            
            if abs(turtle3.position.x - target.position.x) <= tolerance &&
                   abs(turtle3.position.y - target.position.y) <= tolerance {
                target.removeFromParent()
                counter -= 1
                target.position.x = 1000
                GameCompleted()
            }
        }
        
        for target in loggerheadTarget {
            if abs(turtle2.position.x - target.position.x) <= tolerance &&
                   abs(turtle2.position.y - target.position.y) <= tolerance {
                target.removeFromParent()
                counter -= 1
                target.position.x = 1000
                GameCompleted()
            }
        }
    }
    
    func GameCompleted() {
        if counter == 0 {
            completed?()
        }
    }
}

