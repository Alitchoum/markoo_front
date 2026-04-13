//
//  BookCardView.swift
//  markoo_front
//
//  Created by alize suchon on 13/04/2026.
//

import SwiftUI

enum BookStatus: String, CaseIterable{
    case finished, abandonned, toRead
    
}
struct BookCardView: View {
    let cover:String
    let title:String
    let author:String
    let satus: BookStatus
    let nbTotalpages: Int
    let currentPage: Int
    var percentage: Int { Int((Double(currentPage) / Double(nbTotalpages)) * 100) }

    
    var body: some View {
        VStack (alignment: .leading){
            Image(cover)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 160)
                .cornerRadius(10)
            Text(title)
                .font(.custom("Parkinsans-medium", size: 16))
            Text(author)
                .font(.custom("DMSAns-Regular", size: 16))
                .foregroundColor(.grisF)
            switch satus {
            case  .finished:
                Text("//ETOILE NOTE")
            case .abandonned:
                //PROGRESS BAR
                HStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.violetC)
                        .frame(height: 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: Double(nbTotalpages) - Double(currentPage))
                                .foregroundColor(.violetF)
                        )
                    Text("\(percentage)%")
                        .font(.custom("DMSans-Regular", size: 16))
                }
              
            default:
                EmptyView()
            }
            
        }
    }
}

#Preview {
    BookCardView(cover: "bookTest", title: "La fille de papier", author: "Musso", satus: .abandonned, nbTotalpages: 300, currentPage: 100)
}
