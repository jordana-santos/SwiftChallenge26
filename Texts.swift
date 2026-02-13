//
//  Texts.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 13/02/26.
//

import SwiftUI

//beggining texts
public func StoryTexts() -> [String]{
    let page1 = """
            Hi! My name is (turtle 1)! I live in Vitória - Brazil, my favorite place in the world. The water is just right, there's lots of food, and plenty of friends. Since this is an island, there are many bridges, piers, and rocks in the water. That’s where the yummiest seaweed grows!
            """
    
    let page2 = """
            As you may have noticed, I’m a green sea turtle! We love to eat seaweed, and that’s why we have this beautiful color. We can live for about 80 years, and we weigh around 230 kilos. Not bad, right?
            """
    
    let page3 = """
            Hello! My name is Careta and I’m a loggerhead sea turtle! I live in the open sea, but I always swim back to the coast to eat. That’s where the best crustaceans are!
            """
    
    let page4 = """
            We loggerhead sea turtles have very strong jaws, shaped like a bird’s beak. They help us crunch our favorite food: crustaceans, of course! We can live for around 70 years and weigh about 180 kilos!
            """
    
    let page5 = """
            What a beautiful day! I’m full of energy. I want to visit Careta before lunch, but it’s quite a long journey. Do you think you could help me get there?
            """
    let textList: [String] = [page1, page2, page3, page4, page5]
    return textList
}


// game intro texts
func IntroTexts() -> [String]{
    let intro1 = """
            Wow! There's so much trash in the water! This place is so beautiful, it makes me sad to see it treated like this. Can you help me clean out the way?  
            """
    
    let intro2 = """
            Look who’s over there! Olga! Let’s invite her to have lunch with Careta. There’s just one problem… there are too many boats! Can you help me stop them so I can swim through?
            """
    
    let intro3 = """
            Finally, we made it! That was a long journey, it even made me hungry. Luckily, it’s lunchtime! 
            """
    let textList: [String] = [intro1, intro2, intro3]
    return textList
}


//explaining how to play each game
func GameTexts() -> [String]{
    let t1 = """
            Drag the trash out of the water and into the trash can.
            """
    
    let t2 = """
            Click on a boat to stop it and keep it from hitting the turtle.
            """
    
    let t3 = """
            Drag each turtle species to its favorite type of food.
            """
    let textList: [String] = [t1, t2, t3]
    return textList
}

//comment after finishing the game
func EndGameTexts() -> [String]{
    let t1 = """
            Thanks! Now I can swim freely!
            """
    
    let t2 = """
            Hi, Olga!
            """
    
    let t3 = """
            Yummy!
            """
    let textList: [String] = [t1, t2, t3]
    return textList
}
