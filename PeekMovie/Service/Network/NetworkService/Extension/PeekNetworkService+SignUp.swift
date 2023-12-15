//
//  PeekNetworkService+SignUp.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 15.12.2023.
//

import Foundation


extension PeekNetworkService {
    
    @discardableResult
    func signUp(credentials: SignUpCredentials) async throws -> PeekUserResponse {
        guard let request = try? createSignUpRequest(credentials: credentials) else {
            throw HTTPError.decodingFailed
        }
        
        return try await networkClient.processRequest(request: request)
    }
    
    
    private func createSignUpRequest(credentials: SignUpCredentials) throws -> HTTPRequest {
        let data = try encoder.encode(credentials)
        
        return HTTPRequest(
            route: "https://api.example.come:8443/api/v1/auth/signUp",
            headers: getHeader(),
            body: data,
            httpMethod: .post
        )
        
    }
    
}
