//
//  HomePage.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct HomePage: View {
    @State private var path: [Route] = []
    
    var body: some View {
        NavigationStack(path: $path){
            VStack(){
                Image("teste")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                
                Text("Home Page")
                
                Button {
                    path.append(.story)
                } label: {
                    Rectangle()
                        .frame(width: 200, height: 50)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .overlay(
                            Text("story page")
                                .foregroundColor(.white)
                        )
                }
            }
            .navigationDestination(for: Route.self) { page in
                page.view(
                    path: $path
                )
            }
        }
    }
}
