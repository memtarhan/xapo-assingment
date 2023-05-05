//
//  HTTPError.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import Foundation

enum HTTPError: Error, CustomStringConvertible {
    case invalidURL
    case invalidData

    var description: String {
        switch self {
        case .invalidURL:
            return "Oops, could not fetch data for you...\nThe URL you passed is invalid"
        case .invalidData:
            return "Oops, could not fetch data for you...\nThe returned data is invalid"
        }
    }
}
