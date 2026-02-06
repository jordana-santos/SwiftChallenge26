//
//  DragGesture.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 23/01/26.
//

import SwiftUI

struct DragGestureModifier: ViewModifier {
    @State private var dragOffset: CGSize = .zero
    @Binding var position: CGPoint
    
    func body(content: Content) -> some View {
        content
            .position(position)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        position.x += (value.translation.width - dragOffset.width)
                        position.y += (value.translation.height - dragOffset.height)
                        dragOffset = value.translation
                    }
                    .onEnded { value in
                        position.x += (value.translation.width - dragOffset.width)
                        position.y += (value.translation.height - dragOffset.height)
                        dragOffset = .zero
                    }
            )
    }
}

extension View {
    func draggable(position: Binding<CGPoint>, isShowing: Binding<Bool>) -> some View {
        modifier(DragGestureModifier(position: position))
    }
}



////
////  waterCleaning.swift
////  SwiftChallenge25
////
////  Created by Jordana Lourenço Santos on 19/01/26.
////
//
//import SwiftUI
//
//struct waterCleaning: View {
//    @Binding var path: [Route]
//    @State private var position: CGPoint = CGPoint(x: 82, y: 81)
//    @State private var position1: CGPoint = CGPoint(x: 100, y: 40)
//    @State private var position2: CGPoint = CGPoint(x: 50, y: 50)
//
//    var body: some View {
//        VStack(){
//            if isShowing {
//                Image("teste")
//                    .draggable(position: $position)
//                    .frame(width: 50, height: 50)
//            }
//            if isShowing1 {
//                Image("pedra")
//                    .frame(width: 50, height: 50)
//                    .draggable(position: $position1)
//            }
//            if isShowing2 {
//                Image("porta")
//                    .frame(width: 50, height: 50)
//                    .draggable(position: $position2)
//            }
//
//            Rectangle()
//                .frame(width: 10, height: 10)
//                .foregroundColor(.gray)
//                .position(x: 100, y: 0)
//        }
//        Spacer()
//
//        Button {
//            path.append(.map)
//        } label: {
//            Rectangle()
//                .frame(width: 200, height: 50)
//                .foregroundColor(.blue)
//                .cornerRadius(10)
//                .overlay(
//                    Text("map")
//                        .foregroundColor(.white)
//                )
//        }
//    }
//}
//
