//
//  ContentView.swift
//  markoo_front
//
//  Created by alize suchon on 25/03/2026.
//

import SwiftUI

struct ContentView: View {
    @Environment(AuthService.self) private var authService
    var body: some View {
            Group {
                if authService.isLoggedIn {
                    ProfileView()
                } else {
                    LoginView()
                }
            }
        }
    }

#Preview {
    ContentView()
}
