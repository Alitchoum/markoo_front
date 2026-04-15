//
//  Untitled.swift
//  markoo_front
//
//  Created by alize suchon on 15/04/2026.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab: Tab = .home
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Group {
                switch selectedTab {
                case .home:
                    DashboardView()
                case .sats:
                    StatsView()
                case .add:
                    SearchBookView()
                case .library:
                    LibraryView()
                case .profile:
                    ProfileView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // 4. Appelle ta TabBar personnalisée ici
            // On utilise le "$" pour passer le lien (Binding) vers selectedTab
            CustomTabBar(currentTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom) // Évite que la barre remonte avec le clavier
    }
}


#Preview {
    TabBarView()
}
