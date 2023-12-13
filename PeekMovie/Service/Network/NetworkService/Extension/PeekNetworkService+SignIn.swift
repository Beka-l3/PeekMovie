//
//  PeekNetworkService+SignIn.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.12.2023.
//

import Foundation


extension PeekNetworkService {
    
    @discardableResult
    func signIn(credentials: SignInCredentials) async throws -> PeekUserResponse {
        guard let request = try? createSignInRequest(credentials: credentials) else {
            throw HTTPError.decodingFailed
        }
        
        return try await networkClient.processRequest(request: request)
    }
    
    
    private func createSignInRequest(credentials: SignInCredentials) throws -> HTTPRequest {
        let data = try encoder.encode(credentials)
        
        return HTTPRequest(
            route: "https://api.example.come:8443/api/v1/auth/signIn",
            headers: getHeader(),
            body: data,
            httpMethod: .post
        )
        
    }
    
}
