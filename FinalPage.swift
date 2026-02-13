//
//  FinalPage.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct FinalPage: View {
    @Binding var path: [Route]
    
    var body: some View {
        GeometryReader() { geo in
            let text = """
                Thank you for your help! Now that you know where we live, come visit us anytime! And if you don’t see us right away, don’t worry, we come up to the surface every 20 minutes to breathe. Just wait a little bit, and we’ll be there!
                """
            ZStack(){
                Background(bg: "bgEnd")
                
                VStack(){
                    Rectangle()
                        .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.2)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(
                            Text(text)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                                .padding(.horizontal, 10)
                                .font(.system(size: 17))
                        )
                        .padding(.horizontal, 10)
                    
                    Spacer()
                    Button {
                        path.removeAll()
                    } label: {
                        Rectangle()
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.05)
                            .offset(x: geo.size.width * 0.025,y: geo.size.height * 0.3)
                            .cornerRadius(10)
                            .overlay(Text("Home"))
                    }
                    .padding()
                    .buttonStyle(.glass)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
}
