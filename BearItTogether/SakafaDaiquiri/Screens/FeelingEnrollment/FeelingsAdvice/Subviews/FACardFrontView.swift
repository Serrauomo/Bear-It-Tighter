//
//  FACardFrontView.swift
//  SakafaDaiquiri
//
//  Created by Andrés Zamora on 17/10/24.
//

import SwiftUI

struct FACardFrontView : View {
    
    // MARK: - Properties
    
    let feelingName: String
    let feelingAdvice: String
    let width: CGFloat
    let height: CGFloat
    @Binding var degrees: Double
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .foregroundStyle(.white.opacity(0.8))
                .frame(width: width, height: height)
                .shadow(color: .black.opacity(0.1), radius: 10)

            VStack(spacing: 12) {
                Text(feelingName)
                    .font(.largeTitle.weight(.heavy).width(.expanded))
                    .padding(.bottom, 20)
                
                Label("You could...", systemImage: "star.fill")
                    .symbolEffect(.bounce)
                    .font(.title2.weight(.semibold))
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: width, alignment: .leading)
                
                Text(feelingAdvice)
                    .frame(maxWidth: width-20)
                    .padding(.horizontal)
            }
        }
        .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0.01))
    }
}
