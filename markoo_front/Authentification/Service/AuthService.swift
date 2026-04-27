//
//  AuthService.swift
//  markoo_front
//
//  Created by alize suchon on 21/04/2026.
//

import Foundation
import Combine

@Observable
class AuthService{
    
    var user: User?
    var isLoggedIn = false
    var loginError: String?
    
    private let baseURL = "http://127.0.0.1:8080/auth"
        
    func register(firstName: String, email: String, password: String) async {
        let registerRequest = RegisterRequest(firstName: firstName, email: email, password: password)
        
        guard let url = URL(string: "\(baseURL)/register") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(registerRequest)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                await MainActor.run {
                    self.loginError = "Réponse invalide du serveur."
                }
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                await MainActor.run {
                    if httpResponse.statusCode == 409 || httpResponse.statusCode == 400 {
                        self.loginError = "Cet email est déjà utilisé."
                    } else {
                        self.loginError = "Erreur lors de l'inscription (Code: \(httpResponse.statusCode))."
                    }
                }
                return
            }
            
            let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
            
            await MainActor.run {
                UserDefaults.standard.set(authResponse.token, forKey: "authToken")
                self.user = authResponse.user
                self.isLoggedIn = true
                self.loginError = nil // On nettoie les erreurs précédentes
            }
            
        } catch {
            await MainActor.run {
                self.loginError = "Erreur technique : impossible de finaliser l'inscription."
                print("Erreur Register: \(error)")
            }
        }
    }
    
    func login(email: String, password: String) async {
        
        let loginRequest = LoginRequest(email: email, password: password)
        
        guard let url = URL(string: "\(baseURL)/login") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(loginRequest)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                await MainActor.run {
                    self.loginError = "Email ou mot de passe incorrect."
                }
                return
            }
            
            let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
            
            await MainActor.run {
                UserDefaults.standard.set(authResponse.token, forKey: "authToken")
                self.user = authResponse.user
                self.isLoggedIn = true
                self.loginError = nil
            }
            
        } catch {
            await MainActor.run {
                self.loginError = "Erreur réseau ou serveur"
            }
        }
    }
    
    func logout() {
        self.user = nil
        self.isLoggedIn = false
        UserDefaults.standard.removeObject(forKey: "authToken")
        
    }
}
