//
//  FeelingsPickerOO.swift
//  Test
//
//  Created by Andrés Zamora on 10/10/24.
//

import Foundation

@Observable
class FeelingsPickerOO {
    private let neighborOffsetsX = [-1, 0, 1, -1, 0, 1, -1, 0, 1]
    private let neighborOffsetsY = [-1, -1, -1, 0, 0, 0, 1, 1, 1]
    private let maxNeighbors = 9
    static let totalRows = 6
    static let totalColumns = 6
    var feelingsPickerDO: FeelingsPickerDO
    
    init(feelingsPickerDO: FeelingsPickerDO) {
        self.feelingsPickerDO = feelingsPickerDO
    }
    
    func setFeelingCards() {
        feelingsPickerDO.selectedFeelingCards.removeAll()
        if feelingsPickerDO.firstInteraction { feelingsPickerDO.firstInteraction.toggle() }
        
        for count in 0..<maxNeighbors {
            let x = Int(feelingsPickerDO.pleasantness.rounded()) + neighborOffsetsX[count]
            let y = Int(feelingsPickerDO.energy.rounded()) + neighborOffsetsY[count]
            
            guard (0..<Self.totalRows).contains(x), (0..<Self.totalColumns).contains(y) else { continue }
            if let feelingCard = FeelingCard.allCards.first(where: { $0.pleasantness == x && $0.energy == y }) {
                feelingsPickerDO.selectedFeelingCards.append(feelingCard)
            }
        }
    }
}
