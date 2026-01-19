//
//  Map.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct Map: View {
    @Binding var path: [Route]
    
    var body: some View {
        Text("Map")
        Button {
            path.append(.gameIntro)
        } label: {
            Rectangle()
                .frame(width: 200, height: 50)
                .foregroundColor(.blue)
                .cornerRadius(10)
                .overlay(
                    Text("game intro")
                        .foregroundColor(.white)
                )
        }
    }
}
