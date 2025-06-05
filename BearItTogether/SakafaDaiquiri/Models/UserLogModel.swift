//
//  UserLogModel.swift
//  SakafaDaiquiri
//
//  Created by Andrés Zamora on 15/10/24.
//

import SwiftData
import Foundation

@Model
class UserLogModel {
    var id: UUID
    var feelings: [Feeling]
    var feelingsAnswers: FeelingAnswers
    var date: Date
    
    init(feelings: [Feeling],
         feelingsAnswers: FeelingAnswers
    ) {
        self.id = UUID()
        self.date = Date()
        self.feelings = feelings
        self.feelingsAnswers = feelingsAnswers
    }
}

struct Feeling: Codable {
    let feelignId: String
    let adviceIndex: Int
    
    init(feelignId: String,
         adviceIndex: Int
    ) {
        self.feelignId = feelignId
        self.adviceIndex = adviceIndex
    }
}

struct FeelingAnswers: Codable {
    let firstAnswer: String
    let secondAnswer: String
    let thirdAnswer: String
    
    init(firstAnswer: String = "",
         secondAnswer: String = "",
         thirdAnswer: String = ""
    ) {
        self.firstAnswer = firstAnswer
        self.secondAnswer = secondAnswer
        self.thirdAnswer = thirdAnswer
    }
}
