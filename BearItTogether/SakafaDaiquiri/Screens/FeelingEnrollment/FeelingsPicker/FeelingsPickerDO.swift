//
//  FeelingsPickerDO.swift
//  SakafaDaiquiri
//
//  Created by Andrés Zamora on 14/10/24.
//

import Foundation

@Observable
class FeelingsPickerDO {
    var selectedFeelingCards: [FeelingCard] = []
    var pleasantness = 0.0
    var energy = 0.0
    var firstInteraction = true
}
