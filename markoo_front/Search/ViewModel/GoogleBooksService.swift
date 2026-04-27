//
//  GoogleBooksService.swift
//  markoo_front
//
//  Created by alize suchon on 27/04/2026.
//

import Foundation

@Observable
class GoogleBooksService {
    
    //TODO: Mettre clé API dans .env (securité!!)
    
    let Apikey = "AIzaSyAaBqDBIgp7TD5JfK0AaFMg2HX3t5MPp9Y"
    
    
    //SEARCH FROM GOOGLE BOOKS API
    func searchBook(query : String) async -> [Items]{
        
        guard let validQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return []
        }
        
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(validQuery)&printType=books&orderBy=relevance&langRestrict=fr&maxResults=10&key=\(Apikey)"
        
        guard let url = URL(string: urlString) else { return [] }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                
                let decodedResponse = try JSONDecoder().decode(GoogleBookResponse.self, from: data)
                
                //TODO: AJOUTER FILTRES POUR PAS METTRE LES LIVRES SANS IMAGE NI AUTEUR .. TITRE AUSSI !!
                
                return decodedResponse.items ?? []
            } else {
                print("Erreur du serveur Google")
                return []
            }
        } catch {
            print("Erreur réseau ou décode : \(error)")
            return []
        }
    }
    
    //TODO: SEARCH BY ISBAN
    //TODO: ADD BOOK IN VAPOR
}

