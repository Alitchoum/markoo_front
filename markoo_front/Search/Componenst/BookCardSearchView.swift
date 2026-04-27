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
    let action : () -> Void
    
    var body: some View {
        HStack (spacing: 15){
            AsyncImage(url: URL(string: cover)) { image in
                image
                    .resizable()
                    .frame(width: 75, height: 110)
                    .cornerRadius(8)
                    .shadow(color:.grisF , radius: 2, x: 0.5, y: 0.5)
                    .padding(.trailing, 10)
            }  placeholder: {
                ProgressView()
                    .frame(width: 75, height: 110)
            }
           
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.custom("Parkinsans-Medium", size: 16))
                    .lineLimit(2)
                Text(author)
                    .font(.custom("DMSans-Regular", size: 16))
                    .foregroundColor(.grisF)
                    .lineLimit(1)
            }
            .padding(.trailing, 18)
            
            Spacer(minLength: 0)
        
            //BUTTON ADD BOOK
            Button{
                action()
            } label : {
                Image("plus")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(10)
                    .background(.violetF)
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
     
        }
        .frame(maxWidth: .infinity)
        .padding(18)
        .background(.white)
        .cornerRadius(20)
    }
}

#Preview {
    BookCardSearchView(cover: "bookTest", title: "La fille de papier", author: "Guillaume Musso") {
        print("action du bouton")
    }
}
