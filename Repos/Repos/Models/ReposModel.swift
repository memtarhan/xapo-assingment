//
//  ReposModel.swift
//  Repos
//
//  Created by Mehmet Tarhan on 04/05/2023.
//

import SwiftUI

@MainActor
class ReposModel: ObservableObject {
    @Published var repos = [RepoDisplayModel]()
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private var currentPage = 0

    private var service: ReposService

    init() {
        service = ReposServiceImplemented()
    }

    func load() {
        isLoading = true

        currentPage += 1

        Task {
            do {
                let items = try await service.fetchRepos(atPage: currentPage)
                repos.append(contentsOf: createDisplayModels(outOfItems: items))

                isLoading = false

            } catch {
                if let httpError = error as? HTTPError {
                    errorMessage = httpError.description
                }
                print("failed to fetch repos at page: \(currentPage)")
                isLoading = false
            }
        }
    }
}

private extension ReposModel {
    func createDisplayModels(outOfItems items: [RepoResponse]) -> [RepoDisplayModel] {
        items.map { RepoDisplayModel(id: $0.id,
                                     details: RepoDetailsDisplayModel(name: $0.name,
                                                                      fullName: $0.fullName,
                                                                      url: URL(string: $0.htmlUrl)!,
                                                                      description: $0.description,
                                                                      createdAt: $0.createdAt.displayable,
                                                                      updatedAt: $0.updatedAt.displayable,
                                                                      pushedAt: $0.pushedAt.displayable),
                                     stats: [
                                         RepoStatsDisplayModel(title: "Watchers", imageName: "eye", value: "\($0.watchersCount)"),
                                         RepoStatsDisplayModel(title: "Forks", imageName: "tuningfork", value: "\($0.forksCount)"),
                                         RepoStatsDisplayModel(title: "Stars", imageName: "star", value: "\($0.stargazersCount)"),
                                     ],
                                     owner: RepoOwnerDisplayModel(avatarUrl: $0.owner.avatarUrl,
                                                                  username: $0.owner.login,
                                                                  profileURL: URL(string: "https://github.com/\($0.owner.login)")!))
        }
    }
}
