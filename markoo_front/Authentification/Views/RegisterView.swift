//
//  RegisterView.swift
//  markoo_front
//
//  Created by alize suchon on 21/04/2026.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(AuthService.self) private var authService
    @State private var firstName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State var showMPD: Bool = false
    
    //TODO: AJOUTER LES MESSAGES D'ERREURS
    
    var body: some View {
        VStack (spacing: 15){
            Text("Register View")
                .font(.custom("Parkinsans-SemiBold", size: 22))
            
            TextFieldView(placeholder: "Prénom", text: $firstName, backgroundColor: .grisC)
            
            TextFieldView(placeholder: "Email", text: $email, backgroundColor: .grisC)
            
            TextFieldPasswordView(placeholder: "Mot de passe", text: $password, backgroundColor: .grisC)
            
            TextFieldPasswordView(placeholder: "Confirmation du Mot de passe", text: $password, backgroundColor: .grisC)
            
            CustomButton(title: "S'enregister", variant: .purple) {
                authService.register(firstName: firstName, email: email, password: password)
            }
            
            VStack(spacing: 5){
                Text("Vous avez déjà un compte ?")
                NavigationLink(destination: RegisterView()){
                    Text("Connectez-vous")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    RegisterView().environment(AuthService())
}
