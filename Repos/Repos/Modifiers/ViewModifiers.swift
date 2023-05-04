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
            .background(Color.primary.opacity(0.6))
            .cornerRadius(20)
            .shadow(color: Color.gray.opacity(0.2), radius: 4)
    }
}

// MARK: - View Extension

extension View {
    func cardStyle() -> some View {
        modifier(Card())
    }
}
