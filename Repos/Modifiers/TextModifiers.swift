//
//  TextModifiers.swift
//  Repos
//
//  Created by Mehmet Tarhan on 04/05/2023.
//

import SwiftUI

// MARK: These modifiers are example of creating a Theme in SwiftUI,

// MARK: With custom modifiers you can create views, texts, images for the whole app

// MARK: - Large Title

struct LargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .font(.largeTitle.bold())
            .foregroundColor(.white)
            .padding(8)
    }
}

// MARK: - Headline

struct Headline: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .font(.headline)
            .padding(8)
    }
}

// MARK: - Link

// TODO: Add link navigation

struct LinkView: ViewModifier {
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
        modifier(LinkView())
    }
}
