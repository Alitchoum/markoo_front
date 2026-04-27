//
//  LoginView.swift
//  markoo_front
//
//  Created by alize suchon on 21/04/2026.
//

import SwiftUI

struct LoginView: View {
    
    @State var authViewmodel: AuthViewModel
    @State var showMPD: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.violetC
                
                VStack(spacing: 20){
                    Text("Login View")
                        .font(.custom("Parkinsans-SemiBold", size: 22))
                    
                    TextFieldView(placeholder: "Email", text: $authViewmodel.email, backgroundColor: .grisC)
                        
                    TextFieldPasswordView(placeholder: "Mot de passe", text: $authViewmodel.password, backgroundColor: .grisC)
                    
                    //ERROR MESSAGE
                    if let errorMessage = authViewmodel.errorMessage ?? authViewmodel.authService.loginError{
                        Text(errorMessage)
                            .foregroundColor(.rouge)
                            .multilineTextAlignment(.center)
                    }
                    
                    CustomButton(title: "Se connecter", variant: .purple) {
                        authViewmodel.checkLoginIsValid()
                    }
                    
                    VStack(spacing: 5){
                        Text("Vous n'avez pas de compte ?")
                        NavigationLink(destination: RegisterView(authViewmodel: AuthViewModel(authService: authViewmodel.authService))){
                            Text("Inscrivez-vous")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .ignoresSafeArea()
        }
    }
}


#Preview {
    let previewService = AuthService()
    let previewViewModel = AuthViewModel(authService: previewService)

    LoginView(authViewmodel: previewViewModel)
        .environment(previewService)
}
