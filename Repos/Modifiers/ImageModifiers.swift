//
//  ImageModifiers.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import SwiftUI


extension Image {
    
    /// This is an alternative to AsyncImage view for iOS 15 and later, iOS 14 does not have AsyncImage
    /// - Parameter url:URLl of an image
    /// - Returns: Image view
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            if let uiImage = UIImage(data: data) {
                return Image(uiImage: uiImage)
                    .resizable()
            }
            return resizable()
        }
        return resizable()
    }
}
