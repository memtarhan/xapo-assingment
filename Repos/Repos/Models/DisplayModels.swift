//
//  DisplayModels.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import Foundation

struct RepoDisplayModel: Identifiable, Equatable {
    let id: Int
    let details: RepoDetailsDisplayModel
    let stats: [RepoStatsDisplayModel]
    let owner: RepoOwnerDisplayModel

    static func == (lhs: RepoDisplayModel, rhs: RepoDisplayModel) -> Bool {
        return lhs.id == rhs.id
    }

    static let sample = RepoDisplayModel(id: 1000000,
                                         details: RepoDetailsDisplayModel.sample,
                                         stats: [RepoStatsDisplayModel.sample],
                                         owner: RepoOwnerDisplayModel.sample)
}

struct RepoDetailsDisplayModel {
    let name: String
    let fullName: String
    let url: URL
    let description: String?
    let createdAt: String
    let updatedAt: String
    let pushedAt: String

    static let sample = RepoDetailsDisplayModel(name: "Sample",
                                                fullName: "Sample Repo",
                                                url: URL(string: "https://github.com/memtarhan/ios-lab")!,
                                                description: "This is just a sample",
                                                createdAt: Date().displayable,
                                                updatedAt: Date().displayable,
                                                pushedAt: Date().displayable)
}

struct RepoOwnerDisplayModel {
    let avatarUrl: String
    let username: String
    let profileURL: URL

    static let sample = RepoOwnerDisplayModel(avatarUrl: "https://avatars.githubusercontent.com/u/32220126?v=4",
                                              username: "memtarhan",
                                              profileURL: URL(string: "https://github.com/memtarhan")!)
}

struct RepoStatsDisplayModel: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let value: String

    static let sample = RepoStatsDisplayModel(title: "Forks", imageName: "tuningfork", value: "1.2k")
}
