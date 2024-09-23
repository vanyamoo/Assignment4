//
//  StandardSetGame.swift
//  Sept24A4
//
//  Created by Vanya Mutafchieva on 23/09/2024.
//

import SwiftUI

@Observable class StandardSetGame {
    
    var cardsInPlay: [Card] {
        setGame.cardsInPlay
    }
    
    private(set) var setGame = createSetGame()
    
    private static func createSetGame() -> SetGame {
        SetGame { numShapes, shape, shading, color in
            CardContent(numOfShapes: numShapes, shading: shading, color: color, shape: shape)
        }
    }
    
//    init(setGame: SetGame = createSetGame()) {
//        self.setGame = setGame
//        
//        self.setGame.dealCards(12)
//    }
    
    var isDeckEmpty: Bool { setGame.deck.isEmpty
    }
    
    var discardPile: [Card] {
        setGame.discardPile
    }
    
    var deck: [Card] {
        setGame.deck
    }
    
    func isCardSelected(_ card: Card) -> Bool {
        card.isIn(setGame.selectedCards)
    }
    
// MARK: - Intents
    
    func deal3MoreCards() {
        setGame.deal3MoreCards()
    }
    
    func newGame() {
        setGame = StandardSetGame.createSetGame()
//        //deal initial 12 cards
//        setGame.dealCards(12)
    }
    
    func select(_ card: Card) {
        setGame.select(card)
    }
    
    func shuffle() {
        setGame.shuffle()
    }
    
}

extension CardContent {
    func allSymbols() -> [Self] {
        var shapesArray = [Self]()
        for _ in 0..<self.numOfShapes {
            shapesArray.append(self)
        }
        return shapesArray
    }
}

extension CardColor {
    func applyColor() -> Color {
        switch self {
        case .red:
                .red
        case .purple:
                .purple
        case .green:
                .green
        }
    }
}

