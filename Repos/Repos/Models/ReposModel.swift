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

    private var currentPage = 0

    private var decoder: JSONDecoder {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return decoder
    }

    func load() {
        isLoading = true

        currentPage += 1
        let repoDetails = "https://api.github.com/repos/t3-oss/t3-env"
        let headers = ["Accept": "application/vnd.github.preview"]

        let dateQuery = "2023-05-01"
        var request = URLRequest(url: URL(string: "https://api.github.com/search/repositories?q=created%3A%3E\(dateQuery)&sort=stars&order=desc&page=\(currentPage)")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        Task {
            do {
                // TODO: Check response and display alert if needed
                let (data, response) = try await URLSession.shared.data(for: request)
                print(data.prettyJSON)

                let result = try decoder.decode(Response.self, from: data)
                let newItems = result.items.map { RepoDisplayModel(id: $0.id,
                                                                   title: $0.name,
                                                                   stars: "\($0.stargazersCount)",
                                                                   watchers: "\($0.watchersCount)",
                                                                   forks: "\($0.forksCount)",
                                                                   createdAt: $0.createdAt.displayable)
                }
                repos.append(contentsOf: newItems)

                isLoading = false

            } catch {
                print(error)
                isLoading = false
                // TODO: Display error
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
    let name: String
    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
    let createdAt: Date
}

struct RepoDisplayModel: Identifiable, Equatable {
    let id: Int
    let title: String
    let stars: String
    let watchers: String
    let forks: String
    let createdAt: String

    static func == (lhs: RepoDisplayModel, rhs: RepoDisplayModel) -> Bool {
        return lhs.id == rhs.id
    }

    static var sample = RepoDisplayModel(id: 1000000, title: "Sample Repo", stars: "4.5k", watchers: "1.2k", forks: "500", createdAt: "2023-05-05")
}

extension Date {
    var displayable: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, hh:mm"
        return dateFormatter.string(from: self)
    }
}
