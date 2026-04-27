//
//  UpdateUserViewModel.swift
//  markoo_front
//
//  Created by alize suchon on 24/04/2026.
//

import Foundation

@Observable
class UpdateUserViewModel{
    
    var authService: AuthService
    var errorMessage: String?
    
    init(authService: AuthService) {
            self.authService = authService
        }
    
    private let baseURL = "http://127.0.0.1:8080/users"
    
    //UPDATE USER INFOS
    func updateUser(token: String, firstName: String?, email: String?, password: String?) async {
        guard let url = URL(string: "\(baseURL)/update") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let newProfile = UpdateProfil(
            firstName: firstName,
            email: email,
            password: password
        )
        
        do {
            
            let encoder = JSONEncoder()
            request.httpBody = try encoder.encode(newProfile)
            
            let (_, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                print("success : User profile is updated")
                
        // Mise à jour profil utilisateur dans le front
                await MainActor.run {
                    if let newFirstName = newProfile.firstName {
                        authService.user?.firstName = newFirstName
                    }
                    if let newEmail = newProfile.email {
                        authService.user?.email = newEmail
                    }
                    if let newPassword = newProfile.password {
                        authService.user?.password = newPassword
                    }
                }
                
            } else {
                if let httpResponse = response as? HTTPURLResponse {
                    print("Error server: \(httpResponse.statusCode)")
                }
            }
            
        } catch {
            print("Error: update user : \(error)")
        }
    }
    
    
    //MARK: FUNCTIONS VERIFICATIONS INFOS UPDATE PROFIL
    
    //CHECK FIRSTNAME & EMAIL
    func checkUpdateUserInfos(token: String, label : String, newValue : String) async -> Bool{
        
        if label == "Prénom"{
            guard !newValue.isEmpty else {
                errorMessage = "Veuillez saisir votre prénom"
                return false
            }
            await updateUser(token: token, firstName: newValue, email : nil , password: nil)
        }
        
        if label == "Email" {
            let validEmail = newValue.contains("@")
            guard !newValue.isEmpty && validEmail else {
                errorMessage = "Veuillez saisir un email valide"
                return false
            }
            await updateUser(token: token, firstName: nil, email : newValue , password: nil)
        }
        return true
    }
    
    // CHECK PASSWORD
    func checkUpdateUserPassword(token: String, newValue : String, confirmPassword : String) async -> Bool{
        let UpperCase = newValue.contains(where: \.isUppercase)
        let LowerCase = newValue.contains(where: \.isLowercase)
        let NumberCase = newValue.contains(where: \.isNumber)
        
        guard !newValue.isEmpty && newValue.count >= 8 && UpperCase && LowerCase && NumberCase else {
            errorMessage = "Veuillez saisir un mot de passe valide"
            return false
        }
        
        guard newValue == confirmPassword else {
            errorMessage = "Les mots de passe ne correspondent pas"
            return false
        }
        await updateUser(token: token, firstName: nil, email : nil , password: newValue)
        return true
        
    }
}

