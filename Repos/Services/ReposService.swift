//
//  ReposService.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import Foundation

protocol ReposService: HTTPWrapper {
    
    /// Fetches a list of repos at given page with given filter
    /// - Parameters:
    ///   - page: The current page repos are at
    ///   - filter: The filter to fetch repos, i.e daily, weekly
    /// - Returns: A list of RepoResponse
    func fetchRepos(atPage page: Int, filter: TrendingFilter) async throws -> [RepoResponse]
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

    func fetchRepos(atPage page: Int, filter: TrendingFilter) async throws -> [RepoResponse] {
        let dateQuery = getDateQuery(forFilter: filter)
        guard let url = URL(string: "\(baseURL)?q=\(dateQuery)&sort=stars&order=desc&page=\(page)") else {
            throw HTTPError.invalidURL
        }

        let headers = ["Accept": "application/vnd.github.preview"]
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers

        let result: ReposResponse = try await handleDataTask(for: request)
        return result.items
    }

    private func getDateQuery(forFilter filter: TrendingFilter) -> String {
        let date = Calendar.current.date(byAdding: filter.calendarComponent, value: filter.componentValue, to: Date())
        // TODO: We can also throw error here if date is not valid
        return "created%3A%3E\(date!.inQueryFormat)"
    }
}
