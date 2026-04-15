//
//  AuthorModel.swift
//  markoo_front
//
//  Created by alize suchon on 15/04/2026.
//

import SwiftUI

struct AuthorModel: Identifiable, Codable {
    let id: UUID
    let image: String
    let firstName: String
    let lastName: String
    let birthDate: Date
    let deathDate: Date?
    let nationality: String
    let books: [BookModel]
    
}

struct InfosItems: Identifiable {
    let id = UUID()
    var picto: String
    var label: String
}
