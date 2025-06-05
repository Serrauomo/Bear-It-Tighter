//
//  UserLogsManager.swift
//  SakafaDaiquiri
//
//  Created by Andrés Zamora on 15/10/24.
//

import Foundation
import SwiftData

@Observable
class UserLogsManager {
    var userLogs: [UserLogModel] = []
    var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func fetch() {
        let sort = [SortDescriptor(\UserLogModel.date)]
        let fetchDescriptor = FetchDescriptor<UserLogModel>(sortBy: sort)
        do {
            userLogs = try modelContext.fetch(fetchDescriptor)
        } catch {
            print("Failed getting user logs: \(error.localizedDescription)")
        }
    }
    
    func addUserLog(feelings: [Feeling], feelingsAnswers: FeelingAnswers) {
        let userLog = UserLogModel(feelings: feelings, feelingsAnswers: feelingsAnswers)
        modelContext.insert(userLog)
        userLogs.append(userLog)
    }
}
