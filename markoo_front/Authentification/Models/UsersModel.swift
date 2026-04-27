//
//  UsersModel.swift
//  markoo_front
//
//  Created by alize suchon on 21/04/2026.
//

import Foundation

struct User : Codable {
    let id: UUID?
    var firstName: String
    var email: String
    var password: String?
}

struct RegisterRequest: Codable {
    let firstName: String
    let email: String
    let password: String
    
}

struct AuthResponse: Codable {
    let user: User
    let token: String
}


struct LoginRequest: Codable {
    let email: String
    let password: String
}
