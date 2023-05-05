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
