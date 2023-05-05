//
//  StubReposService.swift
//  ReposTests
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import Foundation
@testable import Repos

class StubReposService: ReposService {
    // TODO: We can get mocking url, staging, etc.
    private let baseURL = "https://api.github.com/search/repositories"

    // MARK: We can insert any data query

    private lazy var dateQuery: String = {
        let date = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        // TODO: We can also throw error here if date is not valid
        return "created%3A%3E\(date!.inQueryFormat)"
    }()

    func fetchRepos(atPage page: Int) async throws -> [RepoResponse] {
        guard let url = URL(string: "\(baseURL)?q=\(dateQuery)&sort=stars&order=desc&page=\(page)") else {
            throw HTTPError.invalidURL
        }

        let headers = ["Accept": "application/vnd.github.preview"]
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers

        let result: ReposResponse = try await handleDataTask(for: request)
        return result.items
    }
}
