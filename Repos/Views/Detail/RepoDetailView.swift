//
//  RepoDetailView.swift
//  Repos
//
//  Created by Mehmet Tarhan on 04/05/2023.
//

import SwiftUI

struct RepoDetailView: View {
    // No need to bind ´repo´ variable here, because we won´t update its data
    var repo: RepoDisplayModel

    var body: some View {
        List {
            OwnerSection(owner: repo.owner)
            StatsSection(stats: repo.stats)
            DetailsSection(details: repo.details)
            if let description = repo.details.description {
                DescriptionSection(description: description)
            }
        }
        .navigationTitle(repo.details.name)
    }
}

struct RepoDetailSubview_Previews: PreviewProvider {
    static var previews: some View {
        RepoDetailView(repo: RepoDisplayModel.sample)
    }
}
