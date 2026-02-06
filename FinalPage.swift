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
            VStack(){
                Rectangle()
                    .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.2)
                    .foregroundColor(.gray)
                    .cornerRadius(10)
                    .overlay(
                        Text(text)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .padding(.horizontal, 10)
                    )
                    .padding(.horizontal, 10)
                
                Image("green1")
                    .resizable()
                    .frame(width: 80, height: 60)
                    .padding()

                
                Spacer()
                Button {
                    path.removeAll()
                } label: {
                    Rectangle()
                        .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.07)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .overlay(
                            Text("home")
                                .foregroundColor(.white)
                        )
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
}
