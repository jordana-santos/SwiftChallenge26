//
//  HomePage.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 19/01/26.
//

import SwiftUI

struct HomePage: View {
    @State private var path: [Route] = []
    
    var body: some View {
        NavigationStack(path: $path){
            VStack(){
                Text("Home Page")
            }
            .navigationDestination(for: Route.self) { page in
                page.view(
                    path: $path
                )
            }
        }
    }
}
