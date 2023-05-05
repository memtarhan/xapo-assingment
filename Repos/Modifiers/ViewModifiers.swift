//
//  ViewModifiers.swift
//  Repos
//
//  Created by Mehmet Tarhan on 04/05/2023.
//

import SwiftUI

// MARK: - Card

struct Card: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color("GrayBackgroundColor"))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 1)
    }
}

// MARK: - View Extension

extension View {
    func cardStyle() -> some View {
        modifier(Card())
    }
}
