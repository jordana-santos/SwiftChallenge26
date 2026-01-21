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
            
        case .game1:
            waterCleaning(path: path)
            
        case .game2:
            Boats(path: path)
            
        case .game3:
            LunchTime(path: path)
            
        case .final:
            FinalPage(path: path)
        }
    }
}
