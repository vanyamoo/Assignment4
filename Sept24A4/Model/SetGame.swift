//
//  SetGame.swift
//  Sept24A4
//
//  Created by Vanya Mutafchieva on 23/09/2024.
//

import Foundation

struct SetGame {
    private(set) var deck: [Card] //= [Card]()
    
    /// The Array of cards currently selected by the user. Max 3 cards
    private(set) var selectedCards = [Card]()
    
    /// The Array of cards currently in play (displayed on screen)
    private(set) var cardsInPlay = [Card]()
    
    private(set) var discardPile = [Card]()
    
    /// Indicates the Matched state of the selected cards - a matching trio, a non-matching trio or not matched yet (fewer than 3 cards)
    private var isAMatchingTrio: Matched {
        if selectedCards.count == 3 {
            return aMatch() ? .yes : .no // match or mismatch
        }
        else  {
            return .notyet // less than 3 cards
        }
    }
    
    /// Selects/deselects the card and plays a round of the game
    mutating func select(_ card: Card) {
        // do nothing if user selects a matched card
        if card.isMatched == .yes { return }
        
        // if already 3 cards selected
        if isAMatchingTrio == .yes { // match
            //replaceSet()
            discardSet()
        } else if isAMatchingTrio == .no { // mismatch
            deselectSelection()
        }
        // if less than 3 cards selected
        if isAMatchingTrio == .notyet {
            selectDeselect(card)
            checkIfReadyToBeMatched()
        }
    }
    
    private mutating func checkIfReadyToBeMatched() {
        if selectedCards.count == 3 {
            updateMatchedOrMismatchedStatus()
        }
    }

    
    private mutating func selectDeselect(_ card: Card) {
        // if card already selected, deselect it
        if card.isIn(selectedCards) {
            selectedCards.remove(card)
        }
        //else add it to selection
        else {
            if selectedCards.count < 3 {
                selectedCards.append(card)
            }
        }
    }
    
    
    private mutating func updateMatchedOrMismatchedStatus() {
        selectedCards.forEach { selectedCard in
            if let cardIndex = cardsInPlay.firstIndex(where: { $0.id == selectedCard.id } ) {
                cardsInPlay[cardIndex].isMatched = aMatch() ? .yes : .no
            }
        }
    }

    /// Deselects the currently selected cards.
    private mutating func deselectSelection() {
        selectedCards.forEach { selectedCard in
            if let cardIndex = cardsInPlay.firstIndex(where: { $0.id == selectedCard.id } ) {
                cardsInPlay[cardIndex].isMatched = .notyet
            }
        }
        selectedCards.removeAll()
    }
    
    /// Removes the matched cards from the cards currently in play and places them in the discard pile.
    private mutating func discardSet() {
        selectedCards.forEach { selectedCard in
            if let cardIndex = cardsInPlay.firstIndex(where: { $0.id == selectedCard.id } ) {
                //discardPile.append(cardsInPlay.remove(at: cardIndex))
                discardCard(at: cardIndex)
            }
        }
        selectedCards.removeAll()
    }
    
    private mutating func discardCard(at index: Int) {
        discardPile.append(cardsInPlay.remove(at: index))
    }
    
    /// Removes the matched cards from the cards currently in play. Replaces them with a new set of card from the deck, if deck is not empty.
    private mutating func replaceSet() {
        selectedCards.forEach { selectedCard in
            if let cardIndex = cardsInPlay.firstIndex(where: { $0.id == selectedCard.id } ) {
                if !deck.isEmpty {
                    discardPile.append(cardsInPlay[cardIndex])
                    cardsInPlay[cardIndex] = deck.removeFirst()
                } else {
                    //cardsInPlay.remove(at: cardIndex)
                    discardCard(at: cardIndex)
                }
            }
        }
        selectedCards.removeAll()
    }
    
    mutating func deal3MoreCards() {
        if isAMatchingTrio == .yes { // match
            //discardSet()
            replaceSet()
        } else {
            dealCards(3)
        }
    }
    
    init(cardContentFactory: (Int, CardShape, CardShading, CardColor) -> CardContent) {
        // create the deck
        deck = []
        for number in 1...3 {
            for shape in CardShape.allCases {
                for shading in CardShading.allCases {
                    for color in CardColor.allCases {
                        let content = cardContentFactory(number, shape, shading, color)
                        deck.append(Card(content: content, id: deck.count))
                    }
                }
            }
        }
        deck.shuffle()

        //deal initial 12 cards
        dealCards(12)
    }
    
    mutating func shuffle() {
        cardsInPlay.shuffle()
    }
    
    mutating func dealCards(_ numOfCards: Int) {
        
        if deck.count >= numOfCards {
            for _ in 0..<numOfCards {
                cardsInPlay.append(deck.removeFirst())
            }
        }
    }
    
    /// Determines whether a card selection makes a Set (as per the Set rules),  i.e. all three cards have matching attributes or all different attributes
    private func aMatch() -> Bool {
        guard selectedCards.count == 3 else { return false }
        let sum = [
            selectedCards.reduce(0, { result, card in result + card.content.numOfShapes }), // 1 + 1 + 1 = 3
            selectedCards.reduce(0, { result, card in result + card.content.shading.rawValue }), // 1 + 2 + 3 = 6
            selectedCards.reduce(0, { result, card in result + card.content.color.rawValue }), // 2 + 2 + 2 = 6
            selectedCards.reduce(0, { result, card in result + card.content.shape.rawValue })  // 3 + 3 + 3 = 9
        ]
        let isAMatch = sum.reduce(true) { partialResult, attributeSum in
            partialResult && (attributeSum % 3 == 0) } // true && (3 % 3 == 0) && (6 % 3 == 0) && (6 % 3 == 0) && (9 % 3 == 0) = true
        return isAMatch
    }
}

struct Card: Identifiable, Equatable, CustomStringConvertible {
    let content: CardContent
    
    var isMatched: Matched = .notyet
    let id: Int
    
    var description: String {
        "\(id): \(content), isMatched(\(isMatched))"
    }
}

enum Matched: Equatable {
    case notyet
    case yes
    case no
}

extension Array where Element: Identifiable {
    mutating func remove(_ element: Element) {
        if self.count > 0 {
            self.removeAll(where: { $0.id == element.id } )
        }
    }
}

extension Card {
    func isIn(_ cards: [Card]) -> Bool {
        cards.contains(where: {$0.id == id})
    }
}
