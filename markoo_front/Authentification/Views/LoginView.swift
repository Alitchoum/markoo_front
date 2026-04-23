//
//  LoginView.swift
//  markoo_front
//
//  Created by alize suchon on 21/04/2026.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(AuthService.self) private var authService
    @State private var email: String = ""
    @State private var password: String = ""
    @State var showMPD: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20){
                Text("Login View")
                    .font(.custom("Parkinsans-SemiBold", size: 22))
                
                TextFieldView(placeholder: "Email", text: $email, backgroundColor: .grisC)
                    
                TextFieldPasswordView(placeholder: "Mot de passe", text: $password, backgroundColor: .grisC)
                
                CustomButton(title: "Se connecter", variant: .purple) {
                    authService.login(email: email, password: password)
                }
                VStack(spacing: 5){
                    Text("Vous n'avez pas de compte ?")
                    NavigationLink(destination: RegisterView()){
                        Text("Inscrivez-vous.")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}


#Preview {
    LoginView()
        .environment(AuthService())
}
