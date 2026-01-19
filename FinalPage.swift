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
        Text("Final Page")
        
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
