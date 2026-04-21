//
//  FavoriteAuthor.swift
//  markoo_front
//
//  Created by alize suchon on 16/04/2026.
//

import SwiftUI

struct FavoriteAuthorView: View {
    let image: String
    let lastName: String
    let firstName: String
    let bookCount: Int
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 25) {
            Image(image)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment : .leading){
                Text("\(lastName) \(firstName)")
                    .font(.system(size: 16))
                RoundedRectangle(cornerRadius: 10)
                    .fill(.violetC)
                    .frame(height: 15)
                    .overlay(alignment: .topLeading) {
                        GeometryReader { geo in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.violetF)
                                .frame(width: geo.size.width - 50, height: 15)
                            //TODO: METTRE EN PLACE LOGIQUE DE CALCUL RATIO
                            
                        }
                    }
            }
            Text("\(bookCount) Livres")
                .font(.custom("Parkinsans-SemiBold", size: 14))
        }
        .frame(width: .infinity)
    }
}

#Preview {
    FavoriteAuthorView(image: "author", lastName: "Gael", firstName: "Faye", bookCount: 4)
}
