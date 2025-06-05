//
//  CardPickerDO.swift
//  SakafaDaiquiri
//
//  Created by Alessio Garzia Marotta Brusco on 15/10/24.
//

import Foundation

@Observable
class CardPickerDO {
    // FeelingPickerDO.selectedFeelingCards will be assigned to this variable.
    var deck = [FeelingCard]()
    var selectedCards = [FeelingCard]()
}
