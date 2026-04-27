//
//  UpdatePasswordView.swift
//  markoo_front
//
//  Created by alize suchon on 23/04/2026.
//

import SwiftUI

struct UpdatePasswordView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State var updateUserViewModel : UpdateUserViewModel
    
    
    var body: some View {
        
        VStack {
            VStack(spacing: 10){
                Text("Modifier mot de passe")
                    .font(.custom("Parkinsans-SemiBold", size: 22))
                
                Text("Tu peux mettre à jour ton mot de passe ici.")
                    .font(.custom("Parkinsans-Regular", size: 16))
                    .padding(.bottom, 35)
            }
            
            VStack (alignment: .leading, spacing: 15){
                
                Text("Nouveau mot de passe")
                    .fontWeight(.medium)
                
                TextFieldPasswordView(placeholder: "Mot de passe", text: $newPassword, backgroundColor: .violetC)
                
                Text("Confirmer le mot de passe")
                    .fontWeight(.medium)
                TextFieldPasswordView(placeholder: "Confirmation mot de passe", text: $confirmPassword, backgroundColor: .violetC)
            }
                // ERROR MESSAGE
                if let error = updateUserViewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.rouge)
                        .multilineTextAlignment(.center)
                }
                
                
                HStack {
                    CustomButton(title: "Annuler", variant: .gray){
                        dismiss()
                    }
                    
                    CustomButton(title: "Valider", variant: .purple){
                        //action valider - route upadte user
                        Task {
                            guard let token = UserDefaults.standard.string(forKey: "authToken") else { return }
                            
                            let isValid = await updateUserViewModel.checkUpdateUserPassword(token: token, newValue: newPassword, confirmPassword: confirmPassword)
                            if isValid {
                                dismiss()
                            }
                        }
                    }
                }
                .padding(.top, 25)
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 20)
        .background(.white)
        
    }
}

#Preview {
    let previewService = AuthService()
    UpdatePasswordView(updateUserViewModel: UpdateUserViewModel(authService: previewService))
}
