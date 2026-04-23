//
//  ProfilView.swift
//  markoo_front
//
//  Created by alize suchon on 09/04/2026.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(AuthService.self) private var authService
    @State private var activeSheet: SheetType? = nil
    @State private var isDarkModeOn = false
    @State private var isNotificationOn: Bool = false
    
    var body: some View {
       
        VStack(alignment: .leading, spacing: 15) {
            Text("Mon compte")
                .font(.custom("Parkinsans-SemiBold", size: 22))
            
            ScrollView(.vertical, showsIndicators: false) {
                Text("Modifier mes infos")
                    .font(.custom("Parkinsans-Medium", size: 18))
                
                CardContainerView(content: {
                    UserInfosView(picto: "user-edit", title: "Prénom", info: authService.user?.firstName ?? "votre prénom"){
                        activeSheet = .firstname
                    }
                    Divider().padding(.vertical, 15)
                    UserInfosView(picto: "email", title: "Email", info: authService.user?.email ?? "votre email") {
                        activeSheet = .email
                    }
                    Divider().padding(.vertical, 15)
                    UserInfosView(picto: "key", title: "Mot de passe", info: "••••••••") {
                        activeSheet = .password
                    }
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
                    AccountCardView(picto: "close1", title: "Déconnexion"){
                        authService.logout()
                    }
                    Divider().padding(.vertical, 15)
                    AccountCardView(picto: "delete", title: "Supprimer mon compte"){
                        //TODO: add delete account action here
                    }
                })
            }
        }
        .padding(.horizontal, 20)
        .sheet(item: $activeSheet) { sheet in
            switch sheet {
            case .firstname, .email :
                if sheet == .firstname {
                    UpdateInfosView(label: sheet == .firstname ? "Prénom" : "Email")
                       .presentationDetents([.height(350)])
                        .presentationDragIndicator(.visible)
                    //TODO: ARRANGER UN PEU LA TAILLE (ADAPTABLE)
                }
            case .password:
                UpdatePasswordView()
                    .presentationDetents([.height(550)])            
            }
        }
    }
}

#Preview {
    ProfileView().environment(AuthService())
}
