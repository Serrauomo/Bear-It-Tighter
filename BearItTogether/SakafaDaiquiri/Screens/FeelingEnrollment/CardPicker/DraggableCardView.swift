//
//  DraggableCardView.swift
//  SakafaDaiquiri
//
//  Created by Alessio Garzia Marotta Brusco on 14/10/24.
//

import SwiftUI

struct DraggableCardView: View {
    let card: FeelingCard
    let geometry: GeometryProxy?
    
    let addAction: (FeelingCard) -> Void
    let discardAction: (FeelingCard) -> Void
    
    @State private var offset = CGSize.zero
    @State private var rotation = Angle.zero
    
    var body: some View {
        StaticCardView(card: card)
            .offset(offset)
            .rotationEffect(rotation)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        guard let geometry else { return }
                        
                        withAnimation {
                            rotation = .degrees((value.translation.width / geometry.frame(in: .global).width * 0.5) * 70)
                            offset = value.translation
                        }
                    }
                    .onEnded { value in
                        withAnimation {
                            guard let geometry else { return }
                            
                            if offset.width > geometry.frame(in: .global).width * 0.45 {
                                addAction(card)
                            } else if offset.width < -geometry.frame(in: .global).width * 0.45 {
                                discardAction(card)
                            } else {
                                offset = .zero
                                rotation = .zero
                            }
                        }
                    }
            )
    }
}

#Preview {
    GeometryReader { geometry in
        DraggableCardView(card: FeelingCard.previewCards.first!, geometry: geometry) { _ in
            print("add")
        } discardAction: { _ in
            print("discard")
        }
    }
}
