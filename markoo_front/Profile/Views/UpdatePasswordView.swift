//
//  UpdatePasswordView.swift
//  markoo_front
//
//  Created by alize suchon on 23/04/2026.
//

import SwiftUI

struct UpdatePasswordView: View {
    
    @State private var password: String = ""
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 15){
            Text("Modifier votre mot de passe")
                .font(.custom("Parkinsans-SemiBold", size: 22))
            
            Text("Tu peux modifier ton mot de passe ici ")
                .font(.custom("Parkinsans-Regular", size: 16))
            Text("Nouveau mot de passe")
                .fontWeight(.medium)
            
            TextFieldPasswordView(placeholder: "Mot de passe", text: $password, backgroundColor: .violetC)
            
            Text("Confirmer le mot de passe")
                .fontWeight(.medium)
            TextFieldPasswordView(placeholder: "Confirmation mot de passe", text: $password, backgroundColor: .violetC)
            
            HStack {
                CustomButton(title: "Annuler", variant: .gray){
                    //action annuler
                }
                
                CustomButton(title: "Valider", variant: .purple){
                    //action valider - route upadte user
                }
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                   .background(.white)
      
    }
}

#Preview {
    UpdatePasswordView()
}
