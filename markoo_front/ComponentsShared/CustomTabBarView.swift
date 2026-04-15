//
//  TabBarView.swift
//  markoo_front
//
//  Created by alize suchon on 15/04/2026.
//

import SwiftUI

enum Tab : String, CaseIterable {
    case home ,sats, add ,library, profile
    
    func picto(isSelected: Bool) -> String {
        switch self {
        case .home:
            return isSelected ? "home1" : "home2"
        case .sats:
            return isSelected ? "stats-fill": "stats-stroke"
        case .add:
            return "plus"
        case .library:
            return isSelected ? "book-fill" : "book-stroke"
        case .profile:
            return isSelected ? "user-fill" :"user-stroke"
        }
    }
    var label : String {
        switch self {
        case .home: "Accueil"
        case .sats: "Stats"
        case .add: ""
        case .library: "Librairie"
        case .profile: "Profil"
        }
    }
}

struct CustomTabBar: View {
    @Binding var currentTab: Tab
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.self) { tab in
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        currentTab = tab
                    }
                } label: {
                    VStack(spacing: 6) {
                        if tab == .add {
                            Image("plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 22, height: 23)
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Color.violetF)
                                .clipShape(Circle())
                                .offset(y: -5)
                        } else {
                            Image(tab.picto(isSelected: currentTab == tab))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            
                            Text(tab.label)
                                .font(.caption2)
                                .fixedSize()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .foregroundColor(currentTab == tab ? .violetF : .grisF)
                    .background(currentTab == tab && tab != .add ? Color.violetC : Color.clear)
                    .cornerRadius(16)
                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.top, 20)
        .background(Color.white)
        .overlay(
            Rectangle()
                .fill(Color.gray.opacity(0.1))
                .frame(height: 1), alignment: .top
        )
        .padding(.bottom, safeAreaPadding) // S'adapte si iPhone avec ou sans bouton Home
    }
    
    // Calcul dynamique pour le bas de l'écran
    var safeAreaPadding: CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        // Si pas d'encoche en bas (vieux iPhone), on ajoute du padding manuel
        return (window?.safeAreaInsets.bottom ?? 0) == 0 ? 20 : 0
    }
}
#Preview {
    CustomTabBar(currentTab: .constant(.sats))
}
