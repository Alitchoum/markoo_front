//
//  ProfilView.swift
//  markoo_front
//
//  Created by alize suchon on 09/04/2026.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isDarkModeOn = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            Text("Mon compte")
                .font(.custom("Parkinsans-SemiBold", size: 22))
            Text("Modifier mes infos")
                .font(.custom("Parkinsans-Medium", size: 18))
            CardContainerView(content: {
                UserInfosView(picto: "user-edit", title: "Prénom", info: "Emma")
                Divider().padding(.vertical, 15)
                UserInfosView(picto: "email", title: "Email", info: "Emma@test.fr")
                Divider().padding(.vertical, 15)
                UserInfosView(picto: "key", title: "Mot de passe", info: "••••••••")
            })
            Text("Réglages")
                .font(.custom("Parkinsans-Medium", size: 18))
            
            CardContainerView(content: {
                SettingCardView(picto: "moon", title: "Mode Sombre")
                Divider().padding(.vertical, 15)
                SettingCardView(picto: "bell", title: "Notifications")
            })
            
            Text("Compte")
                .font(.custom("Parkinsans-Medium", size: 18))
            CardContainerView(content: {
                AccountCardView(picto: "close1", title: "Déconnexion")
                Divider().padding(.vertical, 15)
                AccountCardView(picto: "delete", title: "Supprimer mon compte")
            })
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ProfileView()
}
