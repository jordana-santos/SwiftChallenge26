//
//  waterCleaning.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct waterCleaning: View {
    @Binding var path: [Route]
    @State private var dragOffset: CGSize = .zero
    @State private var dragOffset2: CGSize = .zero
    @State var position = CGSize.zero
    @State var isDragging = false

    
    var drag: some Gesture {
        DragGesture()
            .onChanged { location in
                dragOffset = location.translation
                isDragging = true
                
            }
            .onEnded { _ in
                position.width += dragOffset.width
                position.height += dragOffset.height
                dragOffset = position
                isDragging = false
            }
    }
    
    var dragLixo2: some Gesture {
        DragGesture()
            .onChanged { location in
                dragOffset2 = location.translation
                isDragging = true
            }
            .onEnded { _ in
                position.width += dragOffset.width
                position.height += dragOffset.height
                dragOffset2 = position
                isDragging = false
            }
    }
    
    var body: some View {
        VStack(){
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
                .offset(x: 82 + dragOffset.width, y: -51 + dragOffset.height)
                .gesture(drag)
            
                
            
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(.purple)
                .offset(x: 0 + dragOffset2.width, y: 0 + dragOffset2.height)
                .gesture(dragLixo2)

            
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(.orange)
                .offset(x: -54 + dragOffset.width, y: 134 + dragOffset.height)
                .gesture(drag)
            
        }
        .navigationTitle(Text("Water Cleaning"))
        Spacer()
        
        Rectangle()
            .frame(width: 100, height: 100)
            .foregroundColor(.gray)
            .offset(x: 130, y: 0)
        
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
 
 criar uma struct q reaproveite o codigo do drag
 ela retorna um gesture
 usar variaveis que recebe dessa struct
 usar essas variaveis atraves do @biding
 colocar um @state na struct 
 
 
 
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
