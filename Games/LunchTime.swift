//
//  LunchTime.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SpriteKit

class lunchTime: SKScene {
    let turtle1 = SKSpriteNode(imageNamed: "green")
    let turtle2 = SKSpriteNode(imageNamed: "loggerhead")
    let turtle3 = SKSpriteNode(imageNamed: "green")
    let algae1 = SKSpriteNode(imageNamed: "algae")
    let algae2 = SKSpriteNode(imageNamed: "algae")
    let algae3 = SKSpriteNode(imageNamed: "algae")
    let crustaceans1 = SKSpriteNode(imageNamed: "crustaceans")
    let crustaceans2 = SKSpriteNode(imageNamed: "crustaceans")
    
    let target = CGPoint(x: 350, y: 80)
    let tolerance : CGFloat = 50
    var dragging: SKSpriteNode?
    var counter = CGFloat(5)
    var completed: (() -> Void)?
    
    override func didMove(to view: SKView) {
        backgroundColor = .clear
        
        turtle1.position = relPos(x: 0.26, y: 0.18)
        turtle2.position = relPos(x: 0.5, y: 0.12)
        turtle3.position = relPos(x: 0.77, y: 0.15)
        algae1.position = relPos(x: 0.2, y: 0.5)
        algae2.position = relPos(x: 0.7, y: 0.4)
        algae3.position = relPos(x: 0.3, y: 0.9)
        crustaceans1.position = relPos(x: 0.5, y: 0.65)
        crustaceans2.position = relPos(x: 0.75, y: 0.8)
        
        turtle1.size = relSize(w: 0.18, h: 0.1)
        turtle2.size = relSize(w: 0.15, h: 0.11)
        turtle3.size = relSize(w: 0.18, h: 0.1)
        algae1.size = relSize(w: 0.12, h: 0.1)
        algae2.size = relSize(w: 0.12, h: 0.1)
        algae3.size = relSize(w: 0.12, h: 0.1)
        crustaceans1.size = relSize(w: 0.15, h: 0.1)
        crustaceans2.size = relSize(w: 0.15, h: 0.1)
        
        addChild(algae1)
        addChild(algae2)
        addChild(algae3)
        addChild(crustaceans1)
        addChild(crustaceans2)
        addChild(turtle1)
        addChild(turtle2)
        addChild(turtle3)
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
            CheckDrop(turtle: turtle1, target: target)
            CheckDrop(turtle: turtle3, target: target)
        }
        
        for target in loggerheadTarget {
            CheckDrop(turtle: turtle2, target: target)
        }
    }
    
    func CheckDrop(turtle: SKSpriteNode, target: SKSpriteNode){
        if abs(turtle.position.x - target.position.x) <= tolerance && abs(turtle.position.y - target.position.y) <= tolerance {
            target.removeFromParent()
            counter -= 1
            target.position.x = 5000
            GameCompleted()
        }
    }
    
    func GameCompleted() {
        if counter == 0 {
            completed?()
        }
    }
}

