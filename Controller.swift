//
//  Controller.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import Foundation
import SwiftUI

enum Route: String, Hashable, Codable, RawRepresentable {
    case home
    case story
    case map
    case gameIntro
    case game
    case final
}

extension Route {
    @MainActor @ViewBuilder
    func view(
        path: Binding<[Route]>,
        introPage: Binding <Int>
        
    ) -> some View {
        switch self {
        case .home:
            HomePage()

        case .story:
            StoryPage(path: path)
            
        case .map:
            Map(path: path, introPage: introPage)
            
        case .gameIntro:
            GameIntro(path: path, introPage: introPage)
            
        case .game:
            GameView(path: path, introPage: introPage)
            
        case .final:
            FinalPage(path: path)
        }
    }
}


