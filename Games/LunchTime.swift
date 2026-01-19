//
//  LunchTime.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct LunchTime: View {
    @Binding var path: [Route]
    
    var body: some View {
        Text("LunchTime")
        
        Button {
            path.append(.final)
        } label: {
            Rectangle()
                .frame(width: 200, height: 50)
                .foregroundColor(.blue)
                .cornerRadius(10)
                .overlay(
                    Text("final page")
                        .foregroundColor(.white)
                )
        }
    }
}
