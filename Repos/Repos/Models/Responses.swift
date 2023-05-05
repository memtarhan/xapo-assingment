//
//  Responses.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import Foundation

protocol APIResponse: Decodable { }

struct ReposResponse: APIResponse {
    let items: [RepoResponse]
}

struct RepoResponse: APIResponse {
    let id: Int
    let name: String
    let fullName: String
    let description: String?
    let htmlUrl: String
    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
    let createdAt: Date
    let updatedAt: Date
    let pushedAt: Date
    let owner: RepoOwnerResponse
}

struct RepoOwnerResponse: APIResponse {
    let avatarUrl: String
    let login: String
}
