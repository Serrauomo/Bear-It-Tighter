//
//  FeelingEnrollmentView.swift
//  SakafaDaiquiri
//
//  Created by Andrés Zamora on 14/10/24.
//

import SwiftUI

enum ViewIndex {
    case feelingsPicker
    case cardPicker
    case advice
    case questions
    
    func next() -> ViewIndex? {
        switch self {
        case .feelingsPicker:
            return .cardPicker
        case .cardPicker:
            return .advice
        case .advice:
            return nil
        case .questions:
            return nil
        }
    }
    
    func previous() -> ViewIndex? {
        switch self {
        case .feelingsPicker:
            return nil
        case .cardPicker:
            return .feelingsPicker
        case .advice:
            return .cardPicker
        case .questions:
            return .advice
        }
    }
}

struct FeelingEnrollmentView: View {
    
    // MARK: - Properties
    
    @State var viewIndex = ViewIndex.feelingsPicker
    @State var feelingEnrollmentOO: FeelingEnrollmentOO
    @Environment(\.dismiss) private var dismiss
    
    init(userLogsManager: UserLogsManager) {
        _feelingEnrollmentOO = State(wrappedValue: FeelingEnrollmentOO(userLogsManager: userLogsManager))
    }
    
    var isContinueAvailable: Bool {
        guard viewIndex.next() != nil else { return false }
        
        switch viewIndex {
        case .feelingsPicker:
            return !feelingEnrollmentOO.feelingsPickerDO.selectedFeelingCards.isEmpty
        case .cardPicker:
            return false
        default:
            return true
        }
    }
    
    var isBackAvailable: Bool {
        guard viewIndex.previous() != nil else { return false }
        
        switch viewIndex {
        default:
            return true
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            AnimatedBackgroundView()
                .ignoresSafeArea()
            
            contentView
        }
        .statusBarHidden()
        .overlay(alignment: .topLeading) {
            cancelButton
                .padding(.leading, 35)
                .padding(.top, 15)
                .ignoresSafeArea()
        }
        .overlay(alignment: .topTrailing) {
            doneButton
                .padding(.trailing, 35)
                .padding(.top, 15)
                .ignoresSafeArea()
        }
        .overlay(alignment: .bottom) {
            NavigationOptions(
                isBackAvailable: isBackAvailable,
                isContinueAvailable: isContinueAvailable,
                continueAction: continueAction,
                backAction: backAction
            )
        }
    }
    
    // MARK: - Views
    
    @ViewBuilder
    var cancelButton: some View {
        if viewIndex != .questions {
            Button {
                dismiss()
            } label: {
                Text("Cancel")
                    .fontWeight(.medium)
                    .font(.callout)
                    .padding(.vertical, -6)
            }
            .buttonStyle(PushableProminentButtonStyle(tint: .secondary, shape: Capsule()))
            .transition(.scale.combined(with: .opacity).combined(with: .move(edge: .top)))
        }
    }
    
    @ViewBuilder
    var doneButton: some View {
        if viewIndex == .advice {
            Button {
                feelingEnrollmentOO.addFeelingsEntry()
                dismiss()
            } label: {
                Text("Done")
                    .fontWeight(.medium)
                    .font(.callout)
                    .padding(.vertical, -6)
            }
            .buttonStyle(PushableProminentButtonStyle(tint: .accent, shape: Capsule()))
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        switch viewIndex {
        case .feelingsPicker:
            FeelingsPickerView(feelingsPickerDO: feelingEnrollmentOO.feelingsPickerDO)
        case .cardPicker:
            CardPicker(
                dataObjext: feelingEnrollmentOO.cardPickerDO,
                deck: feelingEnrollmentOO.feelingsPickerDO.selectedFeelingCards,
                continueAction: continueAction
            )
        case .questions:
            FeelingsQuestionsView(dataObject: feelingEnrollmentOO.feelingsQuestionsDO, onSave
                                  : feelingEnrollmentOO.addFeelingsEntry)
        case .advice:
            FeelingsAdviceView(dataObject: feelingEnrollmentOO.feelingsAdviceDO, selectedCards: feelingEnrollmentOO.cardPickerDO.selectedCards)
        }
    }
    
    // MARK: - Methods
    
    func continueAction() {
        withAnimation {
            if let next = viewIndex.next() {
                viewIndex = next
            }
        }
    }
    
    func backAction() {
        withAnimation {
            if let previous = viewIndex.previous() {
                if viewIndex == .advice {
                    feelingEnrollmentOO.cardPickerDO.selectedCards.removeAll()
                    feelingEnrollmentOO.cardPickerDO.deck = feelingEnrollmentOO.feelingsPickerDO.selectedFeelingCards
                }
                
                if viewIndex == .cardPicker {
                    feelingEnrollmentOO.cardPickerDO.selectedCards.removeAll()
                }
                
                viewIndex = previous
            }
        }
    }
}
