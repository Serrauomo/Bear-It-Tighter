//
//  MainView.swift
//  SakafaDaiquiri
//
//  Created by Andrés Zamora on 14/10/24.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @State var addFeelingTriggered = false
    @State var userLogsManager: UserLogsManager
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            contentView
                .navigationTitle("My Feelings")
                .toolbar {
                    Button(action: {
                        addFeelingTriggered = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
        }
        .fullScreenCover(isPresented: $addFeelingTriggered) {
            FeelingEnrollmentView(userLogsManager: userLogsManager)
        }
        .onAppear {
            userLogsManager.fetch()
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        if userLogsManager.userLogs.isEmpty {
            defaultView
        }
        else {
            learnersList
        }
    }
    
    // MARK: - Views
    var learnersList: some View {
        List {
            ForEach(userLogsManager.userLogs) { userLog in
                NavigationLink(destination: UserLogDetailView(userLog: userLog)) {
                    rowView(for: userLog)
                }
            }
        }
    }
    
    private var defaultView: some View {
        return VStack {
            Spacer()
            Text(String(localized: "No feelings logged yet."))
                .font(.title)
                .padding()
            Spacer()
        }
    }
    
    // MARK: - Methods
    func rowView(for userLog: UserLogModel) -> some View {
        Text(userLog.date.formatted(date: .abbreviated, time: .shortened))
    }
    
}
