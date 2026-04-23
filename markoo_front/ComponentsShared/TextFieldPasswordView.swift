//
//  TextFieldPasswordView.swift
//  markoo_front
//
//  Created by alize suchon on 23/04/2026.
//

import SwiftUI

struct TextFieldPasswordView: View {
    let placeholder: String
    @Binding var text: String
    let backgroundColor : Color
    @State private var showMPD: Bool = false
    
    var body: some View {
        HStack {
            if showMPD {
                TextField(placeholder, text: $text, prompt: Text(placeholder).foregroundColor(.grisF))
            } else {
                SecureField(placeholder, text: $text, prompt: Text(placeholder).foregroundColor(.grisF))
            }
            
            Button {
                showMPD.toggle()
            } label: {
 
                Image(showMPD ? "eye-open-stroke" : "eye-close-stroke")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(showMPD ? .black : .grisF)
            }
        }
        .padding()
        .padding(.horizontal, 10)
        .frame(height: 50)
        .background(backgroundColor)
        .cornerRadius(15)
        .disableAutocorrection(true)
        .textInputAutocapitalization(.never)
    }
}

#Preview {
    TextFieldPasswordView(placeholder: "Mot de passe", text: .constant("password000"), backgroundColor: .grisC)
}
