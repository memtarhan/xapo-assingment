//
//  StatsSection.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import SwiftUI

struct StatsSection: View {
    var stats: [RepoStatsDisplayModel]

    var body: some View {
        if #available(iOS 15, *) {
            Section("Stats") {
                ForEach(stats) { stat in
                    HStack {
                        DetailIconImage(imageName: stat.imageName)
                        Text(stat.title)
                            .font(.footnote)
                        Spacer()
                        Text(stat.value)
                            .font(.headline)
                    }
                    .foregroundColor(.primary)
                }
            }

        } else {
            ForEach(stats) { stat in
                HStack {
                    DetailIconImage(imageName: stat.imageName)
                    Text(stat.title)
                        .font(.footnote)
                    Spacer()
                    Text(stat.value)
                        .font(.headline)
                }
                .foregroundColor(.primary)
            }
        }
    }
}

struct StatsSection_Previews: PreviewProvider {
    static var previews: some View {
        StatsSection(stats: [RepoStatsDisplayModel.sample, RepoStatsDisplayModel.sample])
    }
}
