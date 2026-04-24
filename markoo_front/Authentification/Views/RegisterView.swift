//
//  RegisterView.swift
//  markoo_front
//
//  Created by alize suchon on 21/04/2026.
//

import SwiftUI

struct RegisterView: View {
    
    @State var authViewmodel: AuthViewModel
    @State var showMPD: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    //TODO: AJOUTER LES MESSAGES D'ERREURS
    
    var body: some View {
        VStack (spacing: 15){
            Text("Register View")
                .font(.custom("Parkinsans-SemiBold", size: 22))
            
            TextFieldView(placeholder: "Prénom", text: $authViewmodel.firstName, backgroundColor: .grisC)
            
            TextFieldView(placeholder: "Email", text: $authViewmodel.email, backgroundColor: .grisC)
            
            TextFieldPasswordView(placeholder: "Mot de passe", text: $authViewmodel.password, backgroundColor: .grisC)
            
            TextFieldPasswordView(placeholder: "Confirmation du Mot de passe", text: $authViewmodel.confirmPassword, backgroundColor: .grisC)
            
            //ERROR MESSAGE
            if let errorMessage = authViewmodel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.rouge)
                    .multilineTextAlignment(.center)
            }
            
            CustomButton(title: "S'enregister", variant: .purple) {
                authViewmodel.CheckRegisterInfos()
            }
            
            VStack(spacing: 5){
                Text("Vous avez déjà un compte ?")
                Button(action: {
                        dismiss()
                    }) {
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
    let previewService = AuthService()
    let previewViewModel = AuthViewModel(authService: previewService)

    RegisterView(authViewmodel: previewViewModel)
        .environment(previewService)
}
