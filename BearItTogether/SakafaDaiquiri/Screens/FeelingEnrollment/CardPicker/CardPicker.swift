//
//  CardPicker.swift
//  SakafaDaiquiri
//
//  Created by Alessio Garzia Marotta Brusco on 14/10/24.
//

import SwiftUI

struct CardPicker: View {
    @State private var observableObject: CardPickerOO
    
    init(dataObjext: CardPickerDO, deck: [FeelingCard], continueAction: @escaping () -> Void) {
        _observableObject = State(wrappedValue: CardPickerOO(dataObject: dataObjext, continueAction: continueAction))
        observableObject.dataObject.deck = deck
    }
    
    var body: some View {
        VStack {
            Label("Pick your cards!", systemImage: "face.smiling.inverse")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.regularMaterial)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Spacer()
            
            GeometryReader { geometry in
                VStack {
                    CardDeck(deck: $observableObject.dataObject.deck) { card in
                        DraggableCardView(
                            card: card,
                            geometry: geometry,
                            addAction: observableObject.add,
                            discardAction: observableObject.discard
                        )
                        .allowsHitTesting(card == observableObject.dataObject.deck.first)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            Spacer()
        }
        .background {
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.red.gradient)
                    .opacity(0.5)
                    .frame(width: 30, height: 60)
                    .padding(.leading, -20)
                
             Spacer()
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.green.gradient)
                    .opacity(0.5)
                    .frame(width: 30, height: 60)
                    .padding(.trailing, -20)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    CardPicker(dataObjext: CardPickerDO(), deck: FeelingCard.previewCards) { }
}
