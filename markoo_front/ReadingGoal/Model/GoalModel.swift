//
//  GoalmMdel.swift
//  markoo_front
//
//  Created by alize suchon on 14/04/2026.
//

import SwiftUI

enum GoalType: String, Codable, CaseIterable {
    case books, pages, times
    
    var picto : String {
        switch self {
            case .books:
            return "book-stroke"
        case .pages:
            return "book-open"
        case .times:
            return "time"
        }
    }
    
    var typeName : String {
        switch self {
        case .books:
            return "Livres"
        case .pages:
            return "Pages"
        case .times:
            return "Heures"
        }
    }
    
    var description : String {
        switch self {
        case .books:
            return "Books"
        case .pages:
            return "Pages"
        case .times:
            return "Heures"
        }
    }
    
}
