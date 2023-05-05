//
//  RepoRow.swift
//  Repos
//
//  Created by Mehmet Tarhan on 04/05/2023.
//

import SwiftUI

struct RepoRow: View {
    @Binding var model: RepoDisplayModel

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                HStack {
                    Image("repo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.accentColor.opacity(0.7))
                        .frame(width: 24, height: 30)
                    Text(model.details.name)
                        .foregroundColor(.primary)
                }
                .font(.headline)
            }
            VStack(alignment: .trailing) {
                HStack {
                    Text(model.details.createdAt)
                        .font(.footnote)
                        .foregroundColor(.primary)

                    Image(systemName: "calendar")
                        .foregroundColor(.primary)
                }

                HStack {
                    Spacer()

                    ForEach(model.stats.suffix(from: 1)) { stat in
                        HStack(spacing: 8) {
                            DetailIconImage(imageName: stat.imageName)
                                .frame(width: 15, height: 15)
                            Text(stat.value)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
        }
    }
}

struct RepoRow_Previews: PreviewProvider {
    static var previews: some View {
        RepoRow(model: .constant(RepoDisplayModel.sample))
    }
}
