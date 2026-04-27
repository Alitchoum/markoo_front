//
//  BookModel.swift
//  markoo_front
//
//  Created by alize suchon on 15/04/2026.
//

import Foundation


struct BookModel: Identifiable, Codable {
    let id: UUID
    let cover: String
    let title: String
    var resume: String
    var nbPages: Int
    var isbn: String
    var publicationYear: Int
}
