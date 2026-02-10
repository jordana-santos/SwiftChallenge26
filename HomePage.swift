//
//  HomePage.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct HomePage: View {
    @State private var path: [Route] = []
    @State var introPage: Int = 0
    
    var body: some View {
        NavigationStack(path: $path){
            VStack(){
                Image("teste")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                
                Text("Home Page")
                    .padding(10)
                    .font(.title)
                
                Button {
                    path.append(.story)
                    
                } label: {
                    Rectangle()
                        .frame(width: 200, height: 50)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .overlay(
                            Text("start")
                                .foregroundColor(.white)
                        )
                }
            }
            .navigationDestination(for: Route.self) { page in
                page.view(
                    path: $path,
                    introPage: $introPage
                )
            }
            .onAppear(){
                MusicManager.shared.playMusic()
            }
        }
    }
}
