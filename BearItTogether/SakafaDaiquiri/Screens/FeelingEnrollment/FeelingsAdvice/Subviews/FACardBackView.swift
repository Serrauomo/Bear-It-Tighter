//
//  FACardBackView.swift
//  SakafaDaiquiri
//
//  Created by Andrés Zamora on 17/10/24.
//

import SwiftUI

struct FACardBackView : View {
    
    // MARK: - Properties
    
    let imageName: String
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

            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 250)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0.01))
    }
}
