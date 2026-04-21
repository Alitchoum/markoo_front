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
    private var cancellables = Set<AnyCancellable>()
    
    func register(firstName: String, email: String, password: String){
        
        let registerRequest = RegisterRequest(firstName: firstName, email: email, password: password)
        
        guard let url = URL(string: "\(baseURL)/register") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(registerRequest)
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: AuthResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error registering user: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] response in
                
                UserDefaults.standard.set(response.token, forKey: "authToken")
                self?.user = response.user
                self?.isLoggedIn = true
            })
            .store(in: &cancellables)
    }
    
    func login(email: String, password: String) {
        
        let loginRequest = LoginRequest(email: email, password: password)
        
        guard let url = URL(string: "\(baseURL)/login") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(loginRequest)
        
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { response in
                guard let httpResponse = response.response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return response.data
            }
         
            .decode(type: AuthResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(_) = completion {
                    self.loginError = "Email ou mot de passe incorrect."
                }
            }, receiveValue: { [weak self] response in
                
                UserDefaults.standard.set(response.token, forKey: "authToken")
                self?.user = response.user
                self?.isLoggedIn = true
            })
            .store(in: &cancellables)
    }
    
    func logout() {
        self.user = nil
        self.isLoggedIn = false
        UserDefaults.standard.removeObject(forKey: "authToken")

    }
}
