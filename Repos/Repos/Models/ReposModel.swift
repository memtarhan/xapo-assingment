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

    private var currentPage = 0

    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return decoder
    }

    func load() {
        currentPage += 1
        let repoDetails = "https://api.github.com/repos/t3-oss/t3-env"
        let headers = ["Accept": "application/vnd.github.preview"]

        let dateQuery = "2023-05-01"
        var request = URLRequest(url: URL(string: "https://api.github.com/search/repositories?q=created%3A%3E\(dateQuery)&sort=stars&order=desc&page=\(currentPage)")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        Task {
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                print(data.prettyJSON)

                let result = try decoder.decode(Response.self, from: data)
                let newItems = result.items.map { RepoDisplayModel(id: $0.id,
                                                                   title: $0.fullName,
                                                                   stars: "\($0.stargazersCount)",
                                                                   watchers: "\($0.watchersCount)",
                                                                   forks: "\($0.forksCount)") }
                repos.append(contentsOf: newItems)

            } catch {
                print(error)
            }
        }
    }
}

extension Data {
    var prettyJSON: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .withoutEscapingSlashes]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}

struct Response: Decodable {
    let items: [ItemResponse]
}

struct ItemResponse: Decodable {
    let id: Int
    let fullName: String
    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
}

struct RepoDisplayModel: Identifiable, Equatable {
    let id: Int
    let title: String
    let stars: String
    let watchers: String
    let forks: String

    static func == (lhs: RepoDisplayModel, rhs: RepoDisplayModel) -> Bool {
        return lhs.id == rhs.id
    }
}
