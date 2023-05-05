//
//  FeaturedView.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import SwiftUI

struct FeaturedView: View {
    var repo: RepoDisplayModel
    
    var body: some View {
        VStack(alignment: .leading) {
            OwnerView(owner: repo.owner)
            HStack {
                Image("repo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.accentColor.opacity(0.7))
                    .frame(width: 24, height: 30)
                Text(repo.details.name)
                    .foregroundColor(.primary)
            }
            .font(.headline)
            HStack {
                StatsView(stats: repo.stats, simpleVersion: true)
                Spacer()
            }
        }
        .padding()
        .cardStyle()
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView(repo: RepoDisplayModel.sample)
    }
}
