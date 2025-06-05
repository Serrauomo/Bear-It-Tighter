//
//  FACardView.swift
//  SakafaDaiquiri
//
//  Created by Andrés Zamora on 17/10/24.
//

import SwiftUI

struct FACardView: View {
    
    // MARK: - Properties
    
    var selectedCard: FeelingCard
    @State var backDegrees = 0.0
    @State var frontDegrees = -90.0
    @State var isFlipped = false
    let aspectRatio = 0.6952380952
    
    let width : CGFloat
    let height : CGFloat
    let durationAndDelay : CGFloat = 0.2
    
    init(selectedCard: FeelingCard) {
        self.selectedCard = selectedCard
        width = .screenWidth-40
        height = (width) / aspectRatio
    }
    
    //MARK: - Body
    
    var body: some View {
        ZStack {
            FACardBackView(imageName: selectedCard.name, width: width, height: height, degrees: $backDegrees)
            FACardFrontView(feelingName: selectedCard.name, feelingAdvice: selectedCard.advice, width: width, height: height, degrees: $frontDegrees)
        }.onTapGesture {
            flipCard ()
        }
        .padding(.vertical, 40)
    }
    
    // MARK: - Methods
    
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegrees = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegrees = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegrees = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegrees = 0
            }
        }
    }
}
