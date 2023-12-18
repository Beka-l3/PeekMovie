//
//  PeekNetworkService+RestorePasswordByEmail.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 18.12.2023.
//

import Foundation


extension PeekNetworkService {
    
    func restorePasswordByEmail(credentials: RestorePasswordByEmailCredentials) async throws -> EmptyResponse {
        guard let request = try? createRestorePasswordByEmailRequest(credentials: credentials) else {
            throw HTTPError.decodingFailed
        }
        
        return try await networkClient.processRequest(request: request)
    }
    
    private func createRestorePasswordByEmailRequest(credentials: RestorePasswordByEmailCredentials) throws -> HTTPRequest {
        let data = try encoder.encode(credentials)
        
        return HTTPRequest(
            route: "https://api.example.come:8443/api/v1/auth/signIn",
            headers: getHeader(),
            body: data,
            httpMethod: .post
        )
        
    }
    
}
