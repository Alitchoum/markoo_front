//
//  UpdateInfosView.swift
//  markoo_front
//
//  Created by alize suchon on 23/04/2026.
//

import SwiftUI

struct UpdateInfosView: View {
    
    let label: String
    @State private var newValue: String = ""
    @Environment(\.dismiss) private var dismiss
    @State var updateUserViewModel : UpdateUserViewModel
    
    var body: some View {
        VStack{
            VStack(spacing: 10){
                Text("Modifier \(label)")
                    .font(.custom("Parkinsans-SemiBold", size: 22))
                
                Text("Tu peux mettre à jour ton \(label) ici.")
                    .font(.custom("Parkinsans-Regular", size: 16))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
            }
            
            VStack(alignment: .leading){
                Text("Prénom")
                    .fontWeight(.medium)
                TextFieldView(placeholder: label, text: $newValue, backgroundColor: .violetC)

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
                
                CustomButton(title: "valider", variant: .purple){
                    //Action valider - route upadte user
                    Task {
                        guard let token = UserDefaults.standard.string(forKey: "authToken") else { return }
                        
                       let isValid = await updateUserViewModel.checkUpdateUserInfos(token: token, label: label, newValue: newValue)
                        if isValid {
                            dismiss()
                        }
                    }
                }
            }
            .padding(.top, 15)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
}

#Preview {
    let previewService = AuthService()

    UpdateInfosView(label: "Prénom", updateUserViewModel:   UpdateUserViewModel(authService: previewService))
}
