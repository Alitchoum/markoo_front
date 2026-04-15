//
//  EmptyReadingCardview.swift
//  markoo_front
//
//  Created by alize suchon on 14/04/2026.
//

import SwiftUI

struct EmptyReadingCardview: View {
    var body: some View {
        HStack (spacing: 25){
            Image("addBook")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 75, maxHeight: 115)
            
            VStack (alignment: .leading, spacing: 4){
                Text("Aucune lecture en cours")
                    .font(.custom("Parkinsans-Medium", size: 16))
                Text("Ta prochaine lecture t'attend !")
                    .font(.custom("DMSans-Regular", size: 16))
                
                Spacer()
                
                HStack (spacing: 10){
                    Image("plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Ajouter")
                        .font(.custom("Parkinsans-Medium", size: 16))
                }
                .frame(minWidth: 80)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .background(.jauneF)
                .foregroundColor(.white)
                .cornerRadius(50)
            }
            Spacer()
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(25)
        .background(.jauneClair)
        .cornerRadius(20)
    }
}

#Preview {
    EmptyReadingCardview()
}
