//
//  AuthViewModel.swift
//  markoo_front
//
//  Created by alize suchon on 24/04/2026.
//

import Foundation

@Observable
class AuthViewModel {
    
   var authService = AuthService()
    var firstName = ""
    var email = ""
    var password = ""
    var confirmPassword = ""
    var errorMessage: String?
    
    init(authService: AuthService) {
            self.authService = authService
        }
    
    func checkLoginIsValid() {
        guard !email.isEmpty && !password.isEmpty else {
            errorMessage = "Veuillez remplir tout les champs"
            return
        }
        
        
        guard !(password.count < 8) else {
            errorMessage = "Le mot de passe doit contenir au moins 8 caractères"
            return
        }
        
        let hasUppercase = password.contains(where: \.isUppercase)
        let hasLowercase = password.contains(where: \.isLowercase)
        let hasNumber = password.contains(where: \.isNumber)
        guard  hasNumber, hasUppercase, hasLowercase else {
            errorMessage = "Le mot de passe doit contenir au moins une majuscule, une minuscule et un chiffre"
            return
        }
        
        let isValidEmail = email.contains("@")
        guard isValidEmail else {
            errorMessage = "Veuillez entrer un email valide"
            return
        }
        
        errorMessage = nil
        authService.loginError = nil
        
        Task {
            await authService.login(email: email, password: password)
        }
        
    }
    
    func CheckRegisterInfos(){
        guard !firstName.isEmpty && !email.isEmpty && !password.isEmpty else {
            errorMessage = "Veuillez remplir tout les champs"
            return
        }
        
        
        guard !(password.count < 8) else {
            errorMessage = "Le mot de passe doit contenir au moins 8 caractères"
            return
        }
        
        let hasUppercase = password.contains(where: \.isUppercase)
        let hasLowercase = password.contains(where: \.isLowercase)
        let hasNumber = password.contains(where: \.isNumber)
        guard  hasNumber, hasUppercase, hasLowercase else {
            errorMessage = "Le mot de passe doit contenir au moins une majuscule, une minuscule et un chiffre"
            return
        }
        
        let isValidEmail = email.contains("@")
        guard isValidEmail else {
            errorMessage = "Veuillez entrer un email valide"
            return
        }
        
        guard password == confirmPassword else {
            errorMessage = "Les mots de passe ne sont pas identiques"
            return
        }
        
        errorMessage = nil
        authService.loginError = nil
        
        Task {
            await authService.register(firstName: firstName, email: email, password: password)
        }
    }
    
}
