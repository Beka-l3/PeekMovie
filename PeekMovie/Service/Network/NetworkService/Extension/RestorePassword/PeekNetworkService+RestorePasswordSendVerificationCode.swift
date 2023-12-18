//
//  PeekNetworkService+RestorePasswordSendVerificationCode.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 18.12.2023.
//

import Foundation


extension PeekNetworkService {
    
    func restorePasswordSendVerificationCode(credentials: RestorePasswordSendVerificationCodeCredentials) async throws -> EmptyResponse {
        guard let request = try? createRestorePasswordSendVerificationCodeRequest(credentials: credentials) else {
            throw HTTPError.decodingFailed
        }
        
        return try await networkClient.processRequest(request: request)
    }
    
    private func createRestorePasswordSendVerificationCodeRequest(credentials: RestorePasswordSendVerificationCodeCredentials) throws -> HTTPRequest {
        let data = try encoder.encode(credentials)
        
        return HTTPRequest(
            route: "https://api.example.come:8443/api/v1/auth/signIn",
            headers: getHeader(),
            body: data,
            httpMethod: .post
        )
        
    }
    
}
