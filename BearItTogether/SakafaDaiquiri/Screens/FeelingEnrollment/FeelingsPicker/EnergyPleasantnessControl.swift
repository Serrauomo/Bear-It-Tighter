//
//  EnergyPleasantnessControl.swift
//  SakafaDaiquiri
//
//  Created by Alessio Garzia Marotta Brusco on 16/10/24.
//

import SwiftUI

struct EnergyPleasantnessControl: View {
    @Binding var energy: Double
    @Binding var pleasantness: Double
    let onChange: () -> Void
    
    @State private var selection: CGPoint? = nil
    
    private var width = 200.0
    private var height = 200.0
    
    init(energy: Binding<Double>, pleasantness: Binding<Double>, onChange: @escaping () -> Void) {
        _energy = energy
        _pleasantness = pleasantness
        self.onChange = onChange
    }
    
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                if let selection {
                    let fillPath = Path { path in
                        path.addArc(
                            center: selection,
                            radius: 10,
                            startAngle: .zero,
                            endAngle: .degrees(360),
                            clockwise: false
                        )
                    }
                    context.fill(fillPath, with: .color(.white.opacity(0.4)))
                }
            } // end Canvas
            .frame(width: width, height: height)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        let xSelection = max(5, min(value.location.x, width - 5))
                        let ySelection = max(5, min(value.location.y, height - 5))
                        selection = CGPoint(x: xSelection, y: ySelection)
                        
                        withAnimation(.bouncy) {
                            energy = (xSelection / (width - 5) * CGFloat(FeelingsPickerOO.totalRows-1))
                            pleasantness = (ySelection / (height - 5) * CGFloat(FeelingsPickerOO.totalColumns-1))
                            onChange()
                        }
                    }
            )
        }
        .background {
            MeshGradient(width: 2, height: 2, points: [
                [0, 0], [1, 0],
                [0, 1], [1, 1]
            ], colors: [.red, .yellow, .blue, .green])
            .noiseEffect()
        }
        .clipShape(.rect(cornerRadius: 22, style: .continuous))
        .padding(8)
        .background(.thinMaterial, in: .rect(cornerRadius: 30, style: .continuous))
        .shadow(color: .primary.opacity(0.3), radius: 10)
    }
}
