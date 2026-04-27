//
//  SearchBarView.swift
//  markoo_front
//
//  Created by alize suchon on 13/04/2026.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var text: String
    var startSearch: () -> Void
    
    var body: some View {
        HStack {
            Image("loupe")
            TextField("Rechercher", text: $text, prompt: Text("Rechercher").foregroundColor(.white) )
                .textInputAutocapitalization(.never)
                .onSubmit {
                    startSearch()
                }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.violetF)
        .foregroundColor(.white)
        .cornerRadius(20)
    }
}

#Preview {
   
    SearchBarView(text: .constant("La fille"), startSearch: {})
}
