//
//  GeometryReader.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import SwiftUI

struct GeometryParameters {
    /// Calculates and returns a dynamic width and height for current orientation
    /// - Parameter size: Frame of current view
    /// - Returns: A dynamic width and height for current orientation
    static func getFeaturedCardFrame(size: CGSize) -> (width: CGFloat, height: CGFloat) {
        let width = size.width
        let height = size.height

        var viewWidth: CGFloat = .zero
        var viewHeight: CGFloat = .zero

        if width < height {
            // Portrait
            viewWidth = width - (width / 4)
            viewHeight = viewWidth / 2

        } else {
            // Landscape
            viewWidth = width / 2
            viewHeight = viewWidth / 2
        }

        return (width: viewWidth, height: viewHeight)
    }
}
