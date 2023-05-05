//
//  ImageModifiers.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import SwiftUI

extension Image {
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
