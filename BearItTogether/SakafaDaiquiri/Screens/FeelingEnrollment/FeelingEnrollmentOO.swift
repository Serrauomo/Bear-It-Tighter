//
//  FeelingEnrollmentOO.swift
//  SakafaDaiquiri
//
//  Created by Andrés Zamora on 14/10/24.
//

import SwiftUI

@Observable
class FeelingEnrollmentOO {
    var feelingsPickerDO: FeelingsPickerDO
    var cardPickerDO: CardPickerDO
    var feelingsAdviceDO: FeelingsAdviceDO
    var feelingsQuestionsDO: FeelingsQuestionsDO
    var userLogsManager: UserLogsManager
    
    init(userLogsManager: UserLogsManager) {
        feelingsPickerDO = FeelingsPickerDO()
        cardPickerDO = CardPickerDO()
        feelingsAdviceDO = FeelingsAdviceDO()
        feelingsQuestionsDO = FeelingsQuestionsDO()
        self.userLogsManager = userLogsManager
    }
    
    func addFeelingsEntry() {
        let selectedCards = feelingsAdviceDO.adviceCards
        var feelings = [Feeling]()
        for selectedCard in selectedCards {
            feelings.append(Feeling(feelignId: selectedCard.id, adviceIndex: selectedCard.adviceIndex))
        }
        userLogsManager.addUserLog(feelings: feelings, feelingsAnswers: feelingsQuestionsDO.feelingAnswers)
    }
}
