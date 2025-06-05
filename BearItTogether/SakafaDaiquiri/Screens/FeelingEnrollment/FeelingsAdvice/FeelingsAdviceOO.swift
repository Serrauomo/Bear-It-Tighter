//
//  FeelingsAdviceOO.swift
//  SakafaDaiquiri
//
//  Created by Andrés Zamora on 17/10/24.
//

import Foundation

@Observable
class FeelingsAdviceOO {
    var dataObject: FeelingsAdviceDO
    var adviceCards: [FeelingCard] = []
    
    init(dataObject: FeelingsAdviceDO) {
        self.dataObject = dataObject
    }
    
    func setAdviceCards(_ selectedCards: [FeelingCard]) {
        for selectedCard in selectedCards {
            var adviceCard = selectedCard
            adviceCard.adviceIndex = Int.random(in: 0...2)
            adviceCards.append(adviceCard)
        }
        dataObject.adviceCards = adviceCards
    }
}
