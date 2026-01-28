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


