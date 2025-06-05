//
//  FeelingsQuestionsOO.swift
//  SakafaDaiquiri
//
//  Created by Andrés Zamora on 17/10/24.
//

import Foundation

@Observable
class FeelingsQuestionsOO {
    var dataObject: FeelingsQuestionsDO
    var firstAnswer: String = ""
    var secondAnswer: String = ""
    var thirdAnswer: String = ""
    
    init(dataObject: FeelingsQuestionsDO) {
        self.dataObject = dataObject
    }
    
    func addFeelingEntry() {
        dataObject.feelingAnswers = FeelingAnswers(firstAnswer: firstAnswer, secondAnswer: secondAnswer, thirdAnswer: thirdAnswer)
    }
}
