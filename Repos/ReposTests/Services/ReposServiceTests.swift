//
//  ReposServiceTests.swift
//  ReposTests
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import XCTest
@testable import Repos

final class ReposServiceTests: XCTestCase {
    private var service: ReposService!
    
    override func setUpWithError() throws {
        service = StubReposService()
    }

    override func tearDownWithError() throws {
        service = nil
    }

    func testRepoResponseDecoding() async throws {
        _ = try await service.fetchRepos(atPage: 1, filter: .monthly)
    }
}
