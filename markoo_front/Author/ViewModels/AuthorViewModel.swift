//
//  AuthorViewmodel.swift
//  markoo_front
//
//  Created by alize suchon on 15/04/2026.
//

import SwiftUI

@Observable
class AuthorViewModel{
    
    let author: AuthorModel
    
    init(author: AuthorModel) {
        self.author = author
    }
    
    var image: String { author.image }
    var firstName: String { author.firstName }
    var lastName: String { author.lastName }
    var birthDate: Date { author.birthDate }
    var deathDate: Date? { author.deathDate ?? nil}
    var nationality: String {author.nationality}
    var books: [BookModel] { author.books }
    
    var ageOrPeriodText: String {
        let calendar = Calendar.current
        let birthYear = calendar.component(.year, from: author.birthDate)
        
        if let death = author.deathDate {
            let deathYear = calendar.component(.year, from: death)
            // Affiche : 1934-1978
            return "\(String(birthYear))-\(String(deathYear))"
        } else {
            let age = calendar.dateComponents([.year], from: author.birthDate, to: Date()).year ?? 0
            return "\(age) ans"
        }
    }
    
    
    var infoCards: [InfosItems] {
        [
            InfosItems(picto: "cake", label: ageOrPeriodText),
            InfosItems(picto: "world", label: author.nationality),
            InfosItems(picto: "book-open", label: "\(author.books.count) livres")
        ]
    }
    
}
