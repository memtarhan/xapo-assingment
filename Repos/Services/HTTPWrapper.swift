//
//  HTTPWrapper.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import Foundation

protocol HTTPWrapper { }

extension HTTPWrapper {
    private var session: URLSession {
        URLSession.shared
    }

    // Customize it and make various of options here, some API could have multiple different date formats.
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'" // Date format in API response
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        return dateFormatter
    }

    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase // No need coding keys , because .convertFromSnakeCase will convert snake case to camel case

        return decoder
    }

    /// Handles data task with async/await
    /// - Parameter urlRequest: URLRequest variable to handle data task
    /// - Returns: Given response type
    func handleDataTask<T: APIResponse>(for urlRequest: URLRequest) async throws -> T {
        let (data, response) = try await session.data(for: urlRequest)
        if let prettyJSON = data.prettyJSON {
            print(prettyJSON)
        }
        guard let httpResponse = (response as? HTTPURLResponse),
              httpResponse.statusCode == 200 else {
            throw HTTPError.invalidData // Or another error
        }

        return try decoder.decode(T.self, from: data)
    }
}
