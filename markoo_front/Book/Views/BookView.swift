//
//  BookView.swift
//  markoo_front
//
//  Created by alize suchon on 09/04/2026.
//

import SwiftUI

struct BookView: View {
    var body: some View {
        VStack{
            Text("Book title")
                .font(.custom("Parkinsans-Medium", size: 22))
            Text("Book title")
                .font(.custom("DMSans-Regular", size: 16))
                .foregroundColor(.grisF)
        }
        VStack(alignment: .leading, spacing: 25){
        
            Text("Résumé")
                .font(.custom("Parkinsans-Medium", size: 16))
            Text("slhvuhojfjqljeghzghgrzhgoghur")
                .font(.custom("DMSans-Regular", size: 16))
            Text("Statistiques")
                .font(.custom("Parkinsans-Medium", size: 16))
            HStack{
                Text("Historique")
                    .font(.custom("Parkinsans-Medium", size: 16))
                Spacer()
                Text("Début le")
                    .font(.custom("DMSans-Regular", size: 14))
                    .foregroundColor(.grisF)
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    BookView()
}
