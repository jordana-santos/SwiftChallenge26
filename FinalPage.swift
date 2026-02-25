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
            
            ZStack(){
                Background(bg: "bgEnd")
                
                VStack(){
                    ZStack(){
                        Image("bubbleBaloon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.1)
                            .rotationEffect(Angle(degrees: 180))
                            .padding(20)
                            .padding(.vertical, 20)
                        
                        Text(checkLanguage()[0])
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .padding(.horizontal, 35)
                            .padding(30)
                            .font(.system(size: 17))
                    }
                   
                    
                    Spacer(minLength: 0)
                    Button {
                        path.removeAll()
                    } label: {
                        Rectangle()
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.05)
                            .offset(x: geo.size.width * 0.025,y: geo.size.height * 0.1)
                            .cornerRadius(10)
                            .overlay(Text(checkLanguage()[1]))
                    }
                    .padding()
                    .buttonStyle(.glass)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
    
    func checkLanguage() -> [String]{
        let textEn = """
            Thank you for your help! Now that you know where we live, come visit us anytime! And if you don’t see us right away, don’t worry, we come up to the surface every 20 minutes to breathe. Just wait a little bit, and we’ll be there!
            """
        let textPt = """
            Obrigada pela sua ajuda! Agora que você sabe onde moramos, venha nos visitar quando quiser! E se não nos vir logo de cara, não se preocupe, nós subimos à superfície a cada 20 minutos para respirar. É só esperar um pouquinho que aparecemos!
            """
        if SettingsPage.shared.isPortuguese {
            return [textPt, "Tela de Início"]
        } else {
            return [textEn, "Home"]
        }
    }
}
