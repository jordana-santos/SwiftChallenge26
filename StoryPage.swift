//
//  StoryPage.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct StoryPage: View {
    @Binding var path: [Route]
    
    var body: some View {
        Text("Story Page")
        
        Button {
            path.append(.map)
        } label: {
            Rectangle()
                .frame(width: 200, height: 50)
                .foregroundColor(.blue)
                .cornerRadius(10)
                .overlay(
                    Text("map")
                        .foregroundColor(.white)
                )
        }
    }
}
