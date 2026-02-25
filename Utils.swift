//
//  Utils.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 13/02/26.
//

import SwiftUI
import SpriteKit

public func Background(bg: String) -> some View{
    GeometryReader() { geo in
        Image(bg)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .frame(width: geo.size.width, height: geo.size.height)
    }
}

extension SKScene {
    public func relPos(x: CGFloat, y: CGFloat) -> CGPoint {
        CGPoint(x: size.width * x, y: size.height * y)
    }

    public func relSize(w: CGFloat, h: CGFloat) -> CGSize {
        CGSize(width: size.width * w, height: size.height * h)
    }
}

@MainActor public func continueButton() -> String{
    if SettingsPage.shared.isPortuguese == true {
        return "Continue"
    } else {
        return "Continuar"
    }
}


