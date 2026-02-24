//
//  Texts.swift
//  SwiftChallenge25
//
//  Created by Jordana Lourenço Santos on 13/02/26.
//

import SwiftUI

//beggining texts
@MainActor public func StoryTexts() -> [String]{
    let textList: [String]
    
    let page1 = """
            Hi! My name is Olga! I live in Vitória - Brazil, my favorite place in the world. The water is just right, there's lots of food, and plenty of friends. Since this is an island, there are many bridges, piers, and rocks in the water. That’s where the yummiest seaweed grows!
            """
    
    let page2 = """
            As you may have noticed, I’m a green sea turtle! We love to eat seaweed, and that’s why we have this beautiful color. We can live for about 80 years, and we weigh around 230 kilos. Not bad, right?
            """
    
    let page3 = """
            Hello! My name is Careta and I’m a loggerhead sea turtle! I live in the open sea, but I always swim back to the coast to eat. That’s where the best crustaceans are!
            """
    
    let page4 = """
            We loggerhead sea turtles have very strong jaws, shaped a little like a bird’s beak. They help us crunch our favorite food: crustaceans, of course! We can live for around 70 years and weigh about 180 kilos!
            """
    
    let page5 = """
            What a beautiful day! I’m full of energy. I want to visit Careta before lunch, but it’s quite a long journey. Do you think you could help me get there?
            """
    //portuguese version
    
    let page1pt = """
        Oi! Meu nome é Olga! Eu moro em Vitória, meu lugar favorito no mundo. A água é perfeita, tem muita comida e muitos amigos. Como aqui é uma ilha, há muitas pontes, píeres e pedras na água. É lá que crescem as algas mais gostosas!
        """
    
    let page2pt = """
        Como você deve ter percebido, eu sou uma tartaruga-verde! Nós adoramos comer algas, e é por isso que temos essa cor tão bonita. Vivemos cerca de 80 anos e pesamos por volta de 230 quilos. Nada mal, né?
        """
    
    let page3pt = """
        Olá! Meu nome é Careta e eu sou uma tartaruga-cabeçuda! Eu vivo em alto mar, mas sempre nado para a costa para comer. É lá que ficam os melhores crustáceos!
        """
    
    let page4pt = """
        Nós, tartarugas-cabeçudas, temos mandíbulas muito fortes, parecidas com o bico de um pássaro. Elas nos ajudam a triturar nossa comida favorita: crustáceos, é claro! Vivemos cerca de 70 anos e pesamos cerca de 180 quilos!
        """
    
    let page5pt = """
        Que dia bonito! Estou cheia de energia! Estou pensando em ir ver Careta no almoço, mas é uma viagem bem longa. Você pode me ajudar a chegar lá?
        """
    
    
    if SettingsPage.shared.language == "pt" {
        textList = [page1pt, page2pt, page3pt, page4pt, page5pt]
    } else {
        textList = [page1, page2, page3, page4, page5]
    }
    
    return textList
}


// game intro texts
@MainActor func IntroTexts() -> [String]{
    let textList: [String]
    
    let intro1 = """
            Wow! There's so much trash in the water! This place is so beautiful, it makes me sad to see it treated like this. Can you help me clean out the way? 
            """
    
    let intro2 = """
            Look who’s over there! Marina! Let’s invite her to have lunch with us! There’s just one problem… there are too many boats! Can you help me stop them so I can swim through?
            """
    
    let intro3 = """
            Finally, we made it! That was a long journey, it even made me hungry. Luckily, it’s lunchtime!
            """
    
    //portuguese version
    let intro1pt = """
            Nossa! Tem muito lixo na água! Este lugar é tão bonito, dá até tristeza ver ele sendo tratado assim. Você pode me ajudar a limpar o caminho?  
            """
    
    let intro2pt = """
            Olha quem está ali! Marina! Vamos convidá-la para almoçar com a gente! Só tem um problema… tem muitos barcos! Você pode me ajudar a parar eles para que eu consiga atravessar?
            """
    
    let intro3pt = """
            Finalmente, chegamos! Foi uma viagem longa, até me deu fome. Ainda bem que é hora do almoço!
            """
    
    if SettingsPage.shared.language == "pt" {
        textList = [intro1pt, intro2pt, intro3pt]
    } else {
        textList = [intro1, intro2, intro3]
    }
    return textList
}


//explaining how to play each game
@MainActor func GameTexts() -> [String]{
    let textList: [String]
    
    let t1 = """
            Drag the trash into the trash can.
            """
    
    let t2 = """
            Click on a boat to stop it and keep it from hitting the turtle.
            """
    
    let t3 = """
            Drag each turtle species to its favorite type of food.
            """
    
    //portuguese version
    let t1pt = """
            Arraste o lixo para a lixeira.
            """
    
    let t2pt = """
            Clique em um barco para pará-lo e evitar que ele atinja a tartaruga.
            """
    
    let t3pt = """
            Arraste cada espécie de tartaruga até o seu tipo de comida favorito.
            """
    
    if SettingsPage.shared.language == "pt" {
        textList = [t1pt, t2pt, t3pt]
    } else {
        textList = [t1, t2, t3]
    }
    return textList
}

//comment after finishing the game
@MainActor func EndGameTexts() -> [String]{
    let textList: [String]
    
    let t1 = """
            Thanks! Now I can swim freely!
            """
    
    let t2 = """
            Hi, Olga!
            """
    
    let t3 = """
            Yummy!
            """
    //portuguese version
    let t1pt = """
            Obrigada! Agora consigo nadar livremente!
            """
    
    let t2pt = """
            Oi, Olga!
            """
    
    let t3pt = """
            Hmmm, que delícia!
            """
    if SettingsPage.shared.language == "pt" {
        textList = [t1pt, t2pt, t3pt]
    } else {
        textList = [t1, t2, t3]
    }
    return textList
}
