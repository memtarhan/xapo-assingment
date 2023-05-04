//
//  TextModifiers.swift
//  Repos
//
//  Created by Mehmet Tarhan on 04/05/2023.
//

import SwiftUI

// MARK: - Large Title Modifier

struct LargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .font(.largeTitle.bold())
            .foregroundColor(.white)
            .padding(8)
    }
}

struct Headline: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .font(.headline)
            .padding(8)
    }
}

// TODO: Add link navigation

struct Link: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .font(.subheadline)
            .padding(8)
    }
}

// MARK: - View Extension

extension View {
    func largeTitleStyle() -> some View {
        modifier(LargeTitle())
    }

    func headlineStyle() -> some View {
        modifier(Headline())
    }

    func linkStyle() -> some View {
        modifier(Link())
    }
}
