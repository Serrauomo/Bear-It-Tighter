//
//  SakafaDaiquiriApp.swift
//  SakafaDaiquiri
//
//  Created by Alessio Garzia Marotta Brusco on 08/10/24.
//

import SwiftUI
import SwiftData

@main
struct SakafaDaiquiriApp: App {
    
    // MARK: - Properties
    let container: ModelContainer
    let userLogsManager: UserLogsManager
    
    init() {
        self.container = try! ModelContainer(for: UserLogModel.self)
        userLogsManager = UserLogsManager(modelContext: container.mainContext)
    }
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            MainView(userLogsManager: userLogsManager)
                .modelContainer(container)
        }
    }
    
}
