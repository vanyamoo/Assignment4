//
//  CardView.swift
//  Sept24A4
//
//  Created by Vanya Mutafchieva on 22/09/2024.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    
    var isFaceUp = true
    
    var body: some View {
        ZStack {
            if isFaceUp {
                Constants.cardBase.stroke(lineWidth: 1.5)
                Constants.cardBase
                    .fill()
                    .foregroundStyle(cardTint)
                    .opacity(flashEffect())
                    .animation(playAnimation(), value: card.isMatched)
                VStack {
                    ForEach(0..<card.content.numOfShapes, id: \.self) { _ in
                        drawShape()
                            .foregroundStyle(card.content.color.applyColor())
                            .aspectRatio(2/1, contentMode: .fit)
                            
                    }
                }
                .padding(12) // TO DO: 15 for < 42 cards; 8 for > 42 cards
                .rotationEffect(rotateShapes())
                .animation(.linear(duration: 0.8).repeatCount(3, autoreverses: false), value: card.isMatched)
            } else {
                Constants.cardBase.stroke(lineWidth: 1.5)
                Constants.cardBase.fill().foregroundStyle(.blue)
            }
        }
        
    }
    
    private func playAnimation() -> Animation? {
        switch card.isMatched {
        case .notyet:
            nil
        case .yes:
            nil
        case .no:
            .linear(duration: 0.8).repeatCount(3, autoreverses: false) // if a mismatch
        }
    }
    
    private func flashEffect() -> Double {
        switch card.isMatched {
        case .notyet:
            1
        case .yes:
            1
        case .no:
            0.7 // if a mismatch
        }
    }
    
    private func rotateShapes() -> Angle {
        switch card.isMatched {
        case .notyet:
                .zero
        case .yes:
                .degrees(360) // rotate if a match
        case .no:
                .zero
        }
    }
    
    private var cardTint: Color {
        switch card.isMatched {
        case .notyet:
                .white
        case .yes:
                .yellow
        case .no:
                .gray
        }
    }
    
    @ViewBuilder
    private func drawShape() -> some View {
        switch card.content.shape {
        case .diamond:
            applyShading(to: Diamond())
        case .rectangle:
            applyShading(to: Rectangle())
        case .capsule:
            applyShading(to: Capsule())
            
        }
    }
    
    @ViewBuilder
    func applyShading(to shape: some Shape) -> some View {
        switch card.content.shading {
        case .open:
            shape.stroke()
        case .solid:
            shape.fill()
        case .shaded:
            ZStack {
                shape.stroke()
                shape.fill().opacity(0.2)
            }
        }
    }
    
    struct Constants {
        static let cardBase = RoundedRectangle(cornerRadius: 10)
    }
}

#Preview {
    let card1 = Card(content: CardContent(numOfShapes: 3, shading: CardShading.shaded, color: CardColor.green, shape: CardShape.capsule), id: 4)
    let card2 = Card(content: CardContent(numOfShapes: 2, shading: .solid, color: .red, shape: .diamond), isMatched: .yes, id: 3)
    let card3 = Card(content: CardContent(numOfShapes: 1, shading: .open, color: .purple, shape: .capsule), isMatched: .no, id: 4)
    return VStack {
        HStack {
            CardView(card: card1)
            CardView(card: card1, isFaceUp: false)
        }
        HStack {
            CardView(card: card2) // matched
            CardView(card: card3) // mismatched
        }
    }
    
    .padding()
}
