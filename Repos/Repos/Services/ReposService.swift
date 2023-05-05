//
//  ReposService.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import Foundation

protocol ReposService: HTTPWrapper {
    func fetchRepos(atPage page: Int) async throws -> [RepoResponse]
}

class ReposServiceImplemented: ReposService {
    // TODO: Can also move baseURL to HTTPWrapper
    private let baseURL = "https://api.github.com/search/repositories"

    // MARK: Can filter data with dateQuery i.e monthly, weekly, yearly etc.

    private lazy var dateQuery: String = {
        let date = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        // TODO: We can also throw error here if date is not valid
        return "created%3A%3E\(date!.inQueryFormat)"
    }()

    func fetchRepos(atPage page: Int) async throws -> [RepoResponse] {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=\(dateQuery)&sort=stars&order=desc&page=\(page)") else {
            throw HTTPError.invalidURL
        }

        let headers = ["Accept": "application/vnd.github.preview"]
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers

        let result: ReposResponse = try await handleDataTask(for: request)
        return result.items
    }
}
