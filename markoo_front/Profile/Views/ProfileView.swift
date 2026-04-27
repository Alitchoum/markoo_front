//
//  ProfilView.swift
//  markoo_front
//
//  Created by alize suchon on 09/04/2026.
//

import SwiftUI

//TODO: LOGIQUE TOGGLE ACTION + UPDATE INFOS -> BACK-END

struct ProfileView: View {
    
    @Environment(AuthService.self) private var authService
    @State private var activeSheet: SheetType? = nil
    @State private var isDarkModeOn = false
    @State private var isNotificationOn: Bool = false
  
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Mon compte")
                .font(.custom("Parkinsans-SemiBold", size: 22))
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack (alignment: .leading, spacing: 20){
                    
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
                        SettingCardView(picto: "moon", title: "Mode Sombre", isActive : $isDarkModeOn)
                        Divider().padding(.vertical, 15)
                        SettingCardView(picto: "bell", title: "Notifications", isActive : $isNotificationOn)
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
        }
        .padding(.horizontal, 20)
        .sheet(item: $activeSheet) { sheet in
            switch sheet {
            case .firstname, .email :
                
                UpdateInfosView(label: sheet == .firstname ? "Prénom" : "Email", updateUserViewModel: UpdateUserViewModel(authService: authService ))
                    .presentationDetents([.fraction(0.4)]) //40% de l'espace total
                
            case .password:
                UpdatePasswordView(updateUserViewModel: UpdateUserViewModel(authService : authService))
                    .presentationDetents([.fraction(0.60)])
            }
        }
    }
}

#Preview {
    ProfileView().environment(AuthService())
}
