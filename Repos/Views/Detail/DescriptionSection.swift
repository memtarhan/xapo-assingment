//
//  DescriptionSection.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import SwiftUI

struct DescriptionSection: View {
    var description: String

    var body: some View {
        if #available(iOS 15, *) {
            Section("Description") {
                Text(description)
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding()
            }

        } else {
            Text(description)
                .font(.body)
                .foregroundColor(.primary)
                .padding()
        }
    }
}

struct DescriptionSection_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionSection(description: RepoDetailsDisplayModel.sample.description!)
    }
}
