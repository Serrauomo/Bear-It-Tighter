//
//  CardDeck.swift
//  SakafaDaiquiri
//
//  Created by Alessio Garzia Marotta Brusco on 17/10/24.
//

import SwiftUI

struct CardDeck<V: View>: View {
    @Binding var deck: [FeelingCard]
    @ViewBuilder let cardView: (FeelingCard) -> V
    
    var body: some View {
        ZStack {
            ForEach(deck.reversed()) { card in
                cardView(card)
                    .offset(
                        card != deck.last ?
                        CGSize(width: 5 * Double.random(in: 0...2), height: 6 * Double.random(in: 0...2))
                        : .zero
                    )
                    .rotationEffect(.degrees(card == deck.last ? 0 : .random(in: -5...5)))
            }
        }
    }
}

#Preview {
    CardDeck(deck: .constant(FeelingCard.previewCards)) { card in
        StaticCardView(card: card)
    }
}
