//
//  DetailIconImage.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import SwiftUI

struct DetailIconImage: View {
    var imageName: String

    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 28)
            .foregroundColor(.accentColor)
    }
}
