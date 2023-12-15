//
//  APIService+SignUp.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 15.12.2023.
//

import UIKit


extension APIService {
    
    func signUp(credentials: SignUpCredentials, isMocking: Bool = false) async throws {
        
        let service: NetworkService = (isMocking || isMockingAll) ? mockNetworkService : networkService
        
        do {
            
            let response = try await service.signUp(credentials: credentials)
            let unwrappedResponse = try unwrapResponse(response: response)
            
            Service.user.loggedIn(user: unwrappedResponse)
            
        } catch {
            
            throw error
            
        }
        
    }
    
    
    private func unwrapResponse(response: PeekUserResponse) throws -> PeekUser {
        guard let username = response.username else { throw UnwrapResponseError.noUsername }
        guard let email = response.email else { throw UnwrapResponseError.noEmail }
        
        return .init(username: username, email: email)
    }
    
    
    private enum UnwrapResponseError: Error {
        case noUsername, noEmail
    }
    
}
