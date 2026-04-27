//
//  SearchView.swift
//  markoo_front
//
//  Created by alize suchon on 09/04/2026.
//

import SwiftUI

struct SearchBookView: View {
    
    @State var googleBookService = GoogleBooksService()
    @State var userSearch = ""
    @State private var searchResults: [Items]? = nil
    
    var body: some View {
        ZStack{
            Color.violetC
            
            VStack (spacing : 25){
                Text("Rechercher un livre")
                    .font(.custom("Parkinsans-Medium", size: 22))
                SearchBarView(text: $userSearch) {
                    Task {
                        searchResults = await googleBookService.searchBook(query: userSearch)
                        
                    }
                }
                ScrollView(.vertical){
                    if let results = searchResults {
                        
                        //NOT FOUND
                        if results.isEmpty {
                            Image("markooNotFound")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 145)
                            Text("Zut ! Aucun livre ne corresponds à votre recherche.")
                                .font(Font.custom("Parkinsans-Medium", size: 16))
                                .multilineTextAlignment(.center)
                            
                        } else {
                            //BOOKS LIST
                            VStack{
                                ForEach(results) { book in
                                    
                                    let safeImageUrl = book.volumeInfo.imageLinks?.smallThumbnail?.replacingOccurrences(of: "http:", with: "https:") ?? ""
                                    BookCardSearchView(cover: safeImageUrl, title: book.volumeInfo.title ?? "Titre non disponible", author: book.volumeInfo.authors?.first ?? "Auteur non disponible" ) {
                                    //TODO: add route pour enregistrer le livre dans vapor
                                    }
                                }
                            }
                        }
                    }
                    else {
                        //SI PAS DE RECHERCHE
                        Text("Entrez le titre, l'auteur, ou scannez son code-barres.")
                            .font(Font.custom("Parkinsans-Medium", size: 16))
                            .multilineTextAlignment(.center)
                    }
                    
                }
                
            }
            .padding(.top , 60)
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
        
        ZStack {
            //LIEN VERS SCANNER
            Button{
                //add action
            } label: {
            
                HStack{
                    Image("scan")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                    Text("Scanner le code-barres")
                        .font(Font.custom("Parkinsans-Medium", size: 16))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .padding(.horizontal, 25)
                .background(.violetF)
                .cornerRadius(20)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 90)
        .padding(.horizontal, 40)
        .background(.white)
        .overlay(
            Rectangle()
                .fill(Color.gray.opacity(0.1))
                .frame(height: 1), alignment: .top
        )
    }
}

#Preview {
    SearchBookView()
}
