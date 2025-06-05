//
//  FeelingsAdviceView.swift
//  SakafaDaiquiri
//
//  Created by Andrés Zamora on 14/10/24.
//

import SwiftUI

struct FeelingsAdviceView: View {
    
    // MARK: - Properties
    
    @State private var observableObject: FeelingsAdviceOO
    
    init(
         dataObject: FeelingsAdviceDO,
         selectedCards: [FeelingCard]
    ) {
        _observableObject = State(wrappedValue: FeelingsAdviceOO(dataObject: dataObject))
        observableObject.setAdviceCards(selectedCards)
    }
    
    // MARK: - View
    
    var body: some View {
        VStack {
            Label("And you feel…", systemImage: "theatermask.and.paintbrush.fill")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.regularMaterial)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(observableObject.dataObject.adviceCards) { selectedCard in
                        FACardView(selectedCard: selectedCard)
                            .scrollTransition(.interactive, axis: .horizontal) { effect, phase in
                                effect
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.95)
                            }
                            .padding(.vertical)
                    }
                }
                .scrollTargetLayout()
            }
            .safeAreaPadding(.horizontal, 20)
            .scrollTargetBehavior(.paging)
            Spacer()
        }
    }
    
}

extension CGFloat {
    @MainActor
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
}

#Preview {
    FeelingsAdviceView(
        dataObject: FeelingsAdviceDO(),
        selectedCards: FeelingCard.previewCards
    )
}
