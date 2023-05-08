//
//  LocalStorage.swift
//  Repos
//
//  Created by Mehmet Tarhan on 08/05/2023.
//

import Foundation

struct LocalStorage {
    static var shared = LocalStorage()

    /// Return true if current user is already signedIn
    @Storage(key: "currentUser_signedIn", defaultValue: false)
    var signedIn: Bool
}
