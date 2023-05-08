//
//  ButtonModifiers.swift
//  Repos
//
//  Created by Mehmet Tarhan on 08/05/2023.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding([.leading, .trailing], 45)
            .padding([.top, .bottom], 16)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .font(.headline)
    }
}
