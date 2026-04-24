//
//  markoo_frontApp.swift
//  markoo_front
//
//  Created by alize suchon on 25/03/2026.
//

import SwiftUI

@main
struct markoo_frontApp: App {
    @State private var authService = AuthService()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authService)
        }
    }
}
