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
            Spacer()
            AspectVGrid(game.cardsInPlay, aspectRatio: 2/3) { card in
                CardView(card: card)
                    .foregroundStyle(game.isCardSelected(card) ? .blue : .black)
                    .padding(4)
                    .onTapGesture {
                        game.select(card)
                        isSelected.toggle()
                    }
            }
            
            HStack {
                Button("New Game", action: { game.newGame() })
                Spacer()
                Button("Deal 3 More Cards", action: { game.deal3MoreCards() } )
                    .disabled(game.isDeckEmpty)
            }
            .padding()
        }
    }
}

#Preview {
    StandardSetGameView(game: StandardSetGame())
}
