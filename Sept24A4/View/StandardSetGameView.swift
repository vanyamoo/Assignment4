//
//  StandardSetGameView.swift
//  Sept24A4
//
//  Created by Vanya Mutafchieva on 23/09/2024.
//

import SwiftUI

struct StandardSetGameView: View {
    var game: StandardSetGame
    
    @State private var isSelected = false
    var body: some View {
        VStack {
            discardPile
            Spacer()
            AspectVGrid(game.cardsInPlay, aspectRatio: 2/3) { card in
                view(for: card)
                    .foregroundStyle(game.isCardSelected(card) ? .blue : .black)
                    .padding(4)
                    .onTapGesture {
                        game.select(card)
                        isSelected.toggle()
                    }
            }
            
            HStack {
                newGameButton
                Spacer()
                deck
            }
            .padding()
        }
    }
    
    private func view(for card: Card) -> some View {
        CardView(card: card)
            //.matchedGeometryEffect(id: card.id, in: dealingNamespace)
            //.transition(.asymmetric(insertion: .identity, removal: .identity))
    }
    
    var newGameButton: some View {
        Button("New Game") { game.newGame() }
    }
    
    var discardPile: some View {
        ZStack {
            if game.discardPile.isEmpty {
                CardView.Constants.cardBase//.stroke(.black)
                    .opacity(0)
            } else {
                ForEach(game.discardPile) { card in
                    view(for: card)
                }
            }
        }
        .frame(width: deckWidth, height: deckWidth / aspectRatio)
    }
    
    var deck: some View {
        //Button("Deal 3 More Cards", action: { game.deal3MoreCards() } )
        //    .disabled(game.isDeckEmpty)
        Button(action: { game.deal3MoreCards() }, label: {
            ZStack {
                ForEach(game.deck) { _ in
                    CardView.Constants.cardBase
                        .frame(width: deckWidth, height: deckWidth / aspectRatio)
                }
            }
        })
        
    }
    
//    private var deck: some View {
//        ZStack {
//            ForEach(game.deck) { card in
//                view(for: card).foregroundStyle(.blue)
//            }
//        }
//        .frame(width: deckWidth, height: deckWidth / aspectRatio)
//        .onTapGesture {
//            game.deal3MoreCards()
//        }
//    }
    
    private let deckWidth: CGFloat = 50
    private let aspectRatio: CGFloat = 2/3
}

#Preview {
    StandardSetGameView(game: StandardSetGame())
}


