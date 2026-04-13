//
//  BookCardSearchView.swift
//  markoo_front
//
//  Created by alize suchon on 13/04/2026.
//

import SwiftUI

struct BookCardSearchView: View {
    let cover: String
    let title: String
    let author: String
    var body: some View {
        HStack{
            Image("bookTest")
                .resizable()
                .frame(width: 100, height: 150)
                .cornerRadius(8)
                .shadow(color:.grisF , radius: 2, x: 0.5, y: 0.5)
                .padding(.trailing, 10)
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.custom("Parkinsans-Medium", size: 16))
                Text(author)
                    .font(.custom("DMSans-Regular", size: 16))
                    .foregroundColor(.grisF)
            }
            Spacer()
            Image("plus")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(10)
                .background(.violetF)
                .cornerRadius(50)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(18)
        .background(.gray.opacity(0.2))
        .cornerRadius(20)
    }
}

#Preview {
    BookCardSearchView(cover: "", title: "La fille de papier", author: "Guillaume Musso")
}
