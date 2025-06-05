//
//  CardPickerOO.swift
//  SakafaDaiquiri
//
//  Created by Alessio Garzia Marotta Brusco on 15/10/24.
//

import Foundation

@Observable
class CardPickerOO {
    var dataObject: CardPickerDO
    private let continueAction: () -> Void
    
    init(dataObject: CardPickerDO, continueAction: @escaping () -> Void) {
        self.dataObject = dataObject
        self.continueAction = continueAction
    }
    
    func discard(_ card: FeelingCard) {
        dataObject.deck.remove(at: index(for: card))
        
        if dataObject.deck.isEmpty {
            continueAction()
        }
    }
    
    func add(_ card: FeelingCard) {
        dataObject.deck.remove(at: index(for: card))
        dataObject.selectedCards.append(card)
        
        if dataObject.deck.isEmpty {
            continueAction()
        }
    }
    
    private func index(for card: FeelingCard) -> [FeelingCard].Index {
        guard let index  = dataObject.deck.firstIndex(of: card) else {
            fatalError("Couldn't find card (\(card.id)) in deck (\(dataObject.deck)).")
        }
        
        return index
    }
}
