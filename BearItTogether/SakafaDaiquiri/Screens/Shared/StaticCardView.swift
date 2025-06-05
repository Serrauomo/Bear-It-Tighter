//
//  StaticCardView.swift
//  SakafaDaiquiri
//
//  Created by Alessio Garzia Marotta Brusco on 14/10/24.
//

import SwiftUI

struct StaticCardView: View {
    static let size = CGSize(width: 330, height: 460)
    static let aspectRatio = 0.7173913
    
    let card: FeelingCard
    
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .foregroundStyle(.regularMaterial)
            .frame(width: Self.size.width, height: Self.size.height)
            .aspectRatio(Self.aspectRatio, contentMode: .fill)
            .shadow(color: .black.opacity(0.1), radius: 10)
            .overlay {
                Image(card.name)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 250)
            }
    }
}

#Preview {
    StaticCardView(card: .init(pleasantness: 1, energy: 1, name: "Anger", advices: ["Advice 1","Advice 2","Advice 3"]))
}
