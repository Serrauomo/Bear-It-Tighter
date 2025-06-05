//
//  FeelingsQuestionsView.swift
//  SakafaDaiquiri
//
//  Created by Andrés Zamora on 14/10/24.
//

import SwiftUI

struct FeelingsQuestionsView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    @State private var observableObject: FeelingsQuestionsOO
    @FocusState private var focus: Bool
    private var onSave: (() -> Void)?
    
    init(dataObject: FeelingsQuestionsDO, onSave: (() -> Void)?) {
        _observableObject = State(wrappedValue: FeelingsQuestionsOO(dataObject: dataObject))
        self.onSave = onSave
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        QuestionEditor(
                            questionText: "How has this influenced your day?",
                            answer: $observableObject.firstAnswer,
                            focus: _focus
                        )
                        QuestionEditor(
                            questionText: "How has this influenced your day?",
                            answer: $observableObject.secondAnswer,
                            focus: _focus
                        )
                        QuestionEditor(
                            questionText: "How has this influenced your day?",
                            answer: $observableObject.thirdAnswer,
                            focus: _focus
                        )
                        Spacer()
                    }
                    .padding()
                }
                Spacer()
                if !focus {
                    saveButton
                }
            }
            .toolbar {
                if focus {
                    Button("Done") {
                        focus = false
                    }
                }
            }
            .navigationTitle("Feeling questions")
        }
    }
    
    // MARK: - View
    
    var saveButton: some View {
            Button(action: saveFeelingEntry) {
                Text("Save")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
    }
    
    // MARK: - Methods
    
    func saveFeelingEntry() {
        observableObject.addFeelingEntry()
        onSave?()
        dismiss()
    }
}

// MARK: - Question Editor

struct QuestionEditor: View {
    let questionText: String
    @Binding var answer: String
    @FocusState var focus: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(questionText)
            TextEditor(text: $answer)
                .colorMultiply(Color(.lightGray))
                .cornerRadius(10)
                .frame(height: 150)
                .focused($focus, equals: true)
        }
    }
}

#Preview {
    FeelingsQuestionsView(dataObject: FeelingsQuestionsDO(), onSave: nil)
}
