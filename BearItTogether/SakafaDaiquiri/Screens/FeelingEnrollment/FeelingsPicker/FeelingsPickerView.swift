//
//  FeelingsPickerView.swift
//  Test
//
//  Created by Andrés Zamora on 10/10/24.
//

import SwiftUI
import Charts

struct FeelingsPickerView: View {
    
    // MARK: - Properties
    
    @State private var feelingsPickerOO: FeelingsPickerOO
    
    init(feelingsPickerDO: FeelingsPickerDO) {
        feelingsPickerOO = FeelingsPickerOO(feelingsPickerDO: feelingsPickerDO)
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Text("Hey, what's up?")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.regularMaterial)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            ZStack {
                if !feelingsPickerOO.feelingsPickerDO.selectedFeelingCards.isEmpty {
                    CardDeck(deck: .constant(feelingsPickerOO.feelingsPickerDO.selectedFeelingCards), cardView: StaticCardView.init)
                        .scaleEffect(0.9)
                        .transition(.scale.combined(with: .opacity))
                }
                
                if feelingsPickerOO.feelingsPickerDO.selectedFeelingCards.isEmpty {
                    Label("Pick a color!", systemImage: "swatchpalette.fill")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundStyle(.regularMaterial)
                }
            }
            .animation(.default, value: feelingsPickerOO.feelingsPickerDO.selectedFeelingCards.isEmpty)
            
            Spacer()
            
            EnergyPleasantnessControl(
                energy: $feelingsPickerOO.feelingsPickerDO.energy,
                pleasantness: $feelingsPickerOO.feelingsPickerDO.pleasantness,
                onChange: feelingsPickerOO.setFeelingCards
            )
        }
        .padding()
    }
    
    // MARK: - Views
    
    var headerOptions: some View {
        VStack {
            VStack(spacing: 20) {
                Text("How do you feel today?")
                    .font(.title)
                Text("Please pick a color")
                    .font(.title3)
            }
        }
    }
}
