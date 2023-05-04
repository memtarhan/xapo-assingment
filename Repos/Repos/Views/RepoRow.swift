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
                    Text(model.title)
//                    Spacer()
                }
                .font(.headline)
            }
            VStack(alignment: .trailing) {
                HStack {
                    Text(model.createdAt)
                        .font(.footnote)
                    Image(systemName: "calendar")
                }

                HStack {
                    Spacer()

                    HStack(spacing: 0) {
                        Image("fork")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.accentColor.opacity(0.7))
                            .frame(width: 24, height: 24)
                        Text("2.5k")
                            .font(.subheadline)
                    }

                    HStack(spacing: 0) {
                        Image("star")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.accentColor.opacity(0.7))
                            .frame(width: 24, height: 24)
                        Text("2.5k")
                            .font(.subheadline)
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
