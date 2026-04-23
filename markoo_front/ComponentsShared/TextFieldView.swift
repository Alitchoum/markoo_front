//
//  TextFieldView.swift
//  markoo_front
//
//  Created by alize suchon on 23/04/2026.
//

import SwiftUI

struct TextFieldView: View {
    
    var placeholder: String
    @Binding var text: String
    var picto : String? = nil
    var backgroundColor : Color
    
    var body: some View {
        ZStack {
            TextField(placeholder, text: $text ,
                      prompt: Text(placeholder).foregroundColor(.grisF))
            .padding()
            .padding(.horizontal, 10)
            .frame(height: 50)
            .background(backgroundColor)
            .cornerRadius(15)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.sentences)
            
            HStack {
                Spacer()
                Image(picto ?? "")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.grisF)
                    .padding(.trailing, 15)
            }
        }
    }
}

#Preview {
    TextFieldView(placeholder: "Prénom", text: .constant("Emma"), picto: "book-open", backgroundColor: .grisC)
}
