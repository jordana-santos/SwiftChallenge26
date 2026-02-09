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
        GeometryReader(){ geo in
            ZStack(){
                Image("ocean")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: geo.size.width, height: geo.size.height)
                
                VStack(){
                    ScrollView(){
                        if currentPage == 2 || currentPage == 3 {
                            Image("caretta")
                                .resizable()
                                .frame(width: 200, height: 150)
                                .padding()
                                .padding(.vertical, 30)
                        } else {
                            Image("green1")
                                .resizable()
                                .frame(width: 200, height: 150)
                                .padding()
                                .padding(.vertical, 30)
                        }
                        
                        if (currentPage < 5) {
                            Text(texts()[currentPage])
                                .padding(30)
                        }
                    }
                    Spacer()
                    
                    Button {
                        currentPage += 1
                        if currentPage == 5 {
                            currentPage = 0
                            path.append(.map)
                        }
                    } label: {
                        Rectangle()
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.05)
                            .offset(x: geo.size.width * 0.025,y: geo.size.height * 0.3)
                            .cornerRadius(10)
                            .overlay(Text("Continue"))
                    }
                    .padding()
                    .buttonStyle(.glass)
                }
                .zIndex(1)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func texts() -> [String]{
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
    
}
