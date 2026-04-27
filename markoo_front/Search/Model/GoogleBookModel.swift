//
//  BookModel.swift
//  markoo_front
//
//  Created by alize suchon on 27/04/2026.
//

import Foundation

struct GoogleBookResponse: Codable{
    let items: [Items]?
}
struct Items: Codable, Identifiable {
    let id: String
    let volumeInfo : VolumeInfo
}

struct VolumeInfo: Codable {
    let title: String?
    let authors: [String]?
    let publishedDate: String?
    let description: String?
    let industryIdentifiers : [IndustryIdentifiers]?
    let pageCount: Int?
    let categories: [String]?
    let imageLinks: ImageLinks?
    
}

struct IndustryIdentifiers: Codable {
    let type: String?
    let identifier: String?
}

struct ImageLinks: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}
