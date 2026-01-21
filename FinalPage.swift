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
        let text = """
            Thank you for your help! Now that you know where we live, come visit us anytime! And if you don’t see us right away, don’t worry, we come up to the surface every 20 minutes to breathe. Just wait a little bit, and we’ll be there!
            """
        VStack(){
            HStack(){
                Rectangle()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.green)
                    .padding(10)
                
                Text(text)
                    .padding(.horizontal, 10)
            }

            Spacer()
            
            Button {
                path.removeAll()
            } label: {
                Rectangle()
                    .frame(width: 200, height: 50)
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                    .overlay(
                        Text("home")
                            .foregroundColor(.white)
                    )
            }
        }
        
        
    }
}
