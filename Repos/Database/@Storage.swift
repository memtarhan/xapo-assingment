//
//  @Storage.swift
//  Repos
//
//  Created by Mehmet Tarhan on 08/05/2023.
//

import Foundation

/// A custom propery wrapper for data stored in UserDefaults
@propertyWrapper
struct Storage<T: Codable> {
    private let key: String
    private let defaultValue: T

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            if
                let value = UserDefaults.standard.object(forKey: key),
                value is String || value is Int || value is Double || value is Bool || value is Date
            {
                return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
            }

            guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
                return defaultValue
            }

            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            if newValue is String || newValue is Int || newValue is Double || newValue is Bool || newValue is Date {
                UserDefaults.standard.set(newValue, forKey: key)
                return
            }

            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
