//
//  ProfilModel.swift
//  markoo_front
//
//  Created by alize suchon on 23/04/2026.
//

import Foundation

enum SheetType : Identifiable {
    var id: Self { return self }
    case firstname, email, password
    
}

struct UpdateProfil: Codable {
    var firstName: String?
    var email: String?
    var password: String?
}
