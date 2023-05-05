//
//  ReposApp.swift
//  Repos
//
//  Created by Mehmet Tarhan on 03/05/2023.
//

import SwiftUI

@main
struct ReposApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init() {
        print("ReposApp initialized")

        // MARK: This is the first point, you can register UserDefaults, RemoteConfig, etc.
        // MARK: Use AppDelegate if necessary
    }

    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
}
