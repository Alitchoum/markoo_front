//
//  UpdateInfosView.swift
//  markoo_front
//
//  Created by alize suchon on 23/04/2026.
//

import SwiftUI

struct UpdateInfosView: View {
    
    let label: String
    @State private var newInfo: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 15){
            Text("Modifier \(label)")
                .font(.custom("Parkinsans-SemiBold", size: 22))
            
            Text("Tu peux mettre à jour ton \(label) ici.")
                .font(.custom("Parkinsans-Regular", size: 16))
                .multilineTextAlignment(.center)
            
            TextFieldView(placeholder: label, text: $newInfo, backgroundColor: .violetC)
            
            HStack {
                CustomButton(title: "Annuler", variant: .gray){
                    dismiss()
                }
                
                CustomButton(title: "valider", variant: .purple){
                    //Action valider - route upadte user
                }
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                   .background(.white)
    }
}

#Preview {
    UpdateInfosView(label: "Prénom")
}
