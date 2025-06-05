//
//  NavigationOptions.swift
//  SakafaDaiquiri
//
//  Created by Andrés Zamora on 14/10/24.
//

import SwiftUI

struct NavigationOptions: View {
    var isBackAvailable = false
    var isContinueAvailable = false
    
    var continueAction: (() -> Void)?
    var backAction: (() -> Void)?
    
    
    var body: some View {
        options
    }
    
    var options: some View {
        HStack {
            if isBackAvailable, let backAction {
                button("Back", systemImage: "chevron.left", action: backAction)
                    .transition(.move(edge: .leading).combined(with: .opacity).combined(with: .scale))
            }
            
            Spacer()
            
            if isContinueAvailable, let continueAction {
                button("Continue", systemImage: "chevron.right", action: continueAction)
                    .transition(.move(edge: .trailing).combined(with: .opacity).combined(with: .scale))
            }
        }
        .padding()
        .animation(.default, value: isBackAvailable)
        .animation(.default, value: isContinueAvailable)
    }
    
    func button(_ title: String, systemImage: String,  action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .aspectRatio(1, contentMode: .fit)
        }
        .buttonStyle(.pushableProminent)
        .accessibilityLabel(title)
    }
}
