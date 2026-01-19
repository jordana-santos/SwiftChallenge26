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
    case game1
    case game2
    case game3
    case final
}

extension Route {
    @ViewBuilder
    func view(
        path: Binding<[Route]>
        
    ) -> some View {
        switch self {
        case .home:
            HomePage()

        case .story:
            StoryPage()
            
        case .map:
            Map()
            
        case .gameIntro:
            GameIntro()
            
        case .game1:
            waterCleaning()
            
        case .game2:
            Boats()
            
        case .game3:
            LunchTime()
            
        case .final:
            FinalPage()
        }
    }
}
