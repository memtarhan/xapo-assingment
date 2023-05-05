//
//  AdaptiveStack.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import SwiftUI

struct AdaptiveStack<Content: View>: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content
    init(horizontalAlignment: HorizontalAlignment = .center,
         verticalAlignment: VerticalAlignment = .center, spacing:
         CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(alignment: horizontalAlignment, spacing:
                    spacing, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: spacing,
                       content: content)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        AdaptiveStack {
            Text("This stack is adaptive to screen height")
            Text("Cool?")
            Text("It will switch between VStack and HStack")
        }
    }
}
