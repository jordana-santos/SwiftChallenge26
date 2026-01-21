//
//  StoryPage.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct StoryPage: View {
    @Binding var path: [Route]
    @State var currentPage: Int = 0
    
    var body: some View {
        VStack(){
            Rectangle()
                .frame(width: 150, height: 150)
                .foregroundColor(.green)
            
            if (currentPage < 3) {
                Text(texts()[currentPage])
                    .padding(30)
            }
            
            Spacer()
            
            Button {
                currentPage += 1
                if currentPage == 3 {
                    currentPage = 0
                    path.append(.map)
                }
            } label: {
                Rectangle()
                    .frame(width: .infinity, height: 50)
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                    .padding(15)
                    .overlay(
                        Text("Continue")
                            .foregroundColor(.white)
                    )
            }
        }
    }
    
    func texts() -> [String]{
        let page1 = """
                Hi! My name is (…)! I live in Vitória, my favorite place in the world. Here, I have everything I could ever want: water at the perfect temperature, lots of food, and many friends. Since this is an island, there are many bridges, piers, and rocks in the water. That’s where the yummiest seaweed grows!

                As you may have noticed, I’m a green sea turtle! All green sea turtles love to eat seaweed, and that’s why we have this beautiful color. We can live for about 80 years, and we weigh around 230 kilos. Not bad, right?
                """
        
        let page2 = """
                Hello! My name is (…) and I’m a loggerhead sea turtle! I live in the open sea, but I always swim back to the coast to eat. That’s where the best crustaceans are!
                
                We loggerhead sea turtles have very strong jaws, shaped a little like a bird’s beak. They help us crunch our favorite food: crustaceans, of course! We can live for around 70 years and weigh about 180 kilos!
                """
        
        let page3 = """
                Today is such a beautiful day, isn’t it? I’m feeling full of energy! I’m planning to go see (…) by lunchtime, but it’s quite a long journey. Do you think you could help me get there?
                """
        let textList: [String] = [page1, page2, page3]
        return textList
    }
    
}
