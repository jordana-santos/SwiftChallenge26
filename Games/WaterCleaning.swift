//
//  waterCleaning.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct waterCleaning: View {
    @Binding var path: [Route]
    
    var body: some View {
        Text("Water Cleaning")
        
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


/*
 O fluxo normalmente é:
     Usuário toca no objeto
     Arrasta → você atualiza offset em tempo real
     Solta o dedo
     Você:
         Calcula posição final
         Testa colisão com o alvo
     Se colidiu:
         Marca como resolvido
         Remove / anima / pontua
 
 
 Procure por estes termos (em inglês, rende muito mais material):
     🔹 Gestures básicas
         SwiftUI DragGesture tutorial
         SwiftUI gestures offset position
     🔹 Detecção de área / colisão
         SwiftUI GeometryReader frame
         SwiftUI check if point inside CGRect
     🔹 Mecânicas de jogo simples
         SwiftUI drag and drop game
         SwiftUI mini game mechanics
 
 */
