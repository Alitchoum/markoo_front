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
    let status: BookStatus
    let nbTotalpages: Int
    let currentPage: Int
    var percentage: Int { Int((Double(currentPage) / Double(nbTotalpages)) * 100) }
    
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4){
            Image(cover)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 160)
                .cornerRadius(10)
                .padding(.bottom, 10)
            Text(title)
                .font(.custom("Parkinsans-medium", size: 16))
            Text(author)
                .font(.custom("DMSAns-Regular", size: 16))
                .foregroundColor(.grisF)
                .padding(.bottom, 10)
            
            switch status {
            case  .finished:
                //TODO: AJOUTER RATING
                Text("//ETOILE NOTE")
            case .abandonned:
               
                //PROGRESS BAR
                HStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.violetC)
                        .frame(height: 16)
                        .overlay(alignment: .topLeading) {
                            // GeometryReader permet de connaître la largeur du rectangle de fond
                            GeometryReader { geo in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.violetF)
                                //calcule la largeur : Largeur totale * Pourcentage / 100
                                    .frame(width: geo.size.width * CGFloat(percentage) / 100)
                            }
                        }
                    
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
    BookCardView(cover: "bookTest", title: "La fille de papier", author: "Musso", status: .abandonned, nbTotalpages: 300, currentPage: 100)
}
