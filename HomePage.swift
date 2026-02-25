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
            GeometryReader { geo in
                ZStack(){
                    Background(bg: "bgGame3")
                    
                    VStack(){
                        Image("happyGreen")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 100)
                            .offset(x: geo.size.width * 0.025,y: geo.size.height * 0.3)
                        
                        Text("Olga's Journey")
                            .padding(10)
                            .font(.title)
                            .offset(x: geo.size.width * 0.025,y: geo.size.height * 0.3)
                        
                        Spacer()
                        
                        //start button
                        Button {
                            path.append(.story)
                        } label: {
                            Rectangle()
                                .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.05)
                                .offset(x: geo.size.width * 0.025,y: geo.size.height * 0.4)
                                .cornerRadius(10)
                                .overlay(
                                    Text(checkLanguage()[0])
                                        .bold()
                                )
                        }
                        .padding(5)
                        .buttonStyle(.glass)
                        
                        
                        //Settings page
                        Button {
                            path.append(.settings)
                        } label: {
                            Rectangle()
                                .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.05)
                                .offset(x: geo.size.width * 0.025,y: geo.size.height * 0.5)
                                .cornerRadius(10)
                                .overlay(Text(checkLanguage()[1]))
                        }
                        .padding(5)
                        .buttonStyle(.glass)
                        
                        //about me page
                        Button {
                            path.append(.aboutMe)
                        } label: {
                            Rectangle()
                                .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.05)
                                .offset(x: geo.size.width * 0.025,y: geo.size.height * 0.6)
                                .cornerRadius(10)
                                .overlay(Text(checkLanguage()[2]))
                        }
                        .padding(5)
                        .buttonStyle(.glass)
                    }
                    .navigationDestination(for: Route.self) { page in
                        page.view(
                            path: $path,
                            introPage: $introPage
                        )
                    }
                    .onAppear(){
                        if Soundtrack.shared.player?.isPlaying != false {
                            Soundtrack.shared.playMusic()
                        }
                    }
                }
            }
            
        }
    }
    
    func checkLanguage() -> [String]{
        if SettingsPage.shared.isPortuguese {
            return ["Iniciar", "Configurações", "Sobre mim"]
        } else {
            return ["Start", "Settings", "About Me"]
        }
    }
}
