//
//  NetworkService.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 12.12.2023.
//

import Foundation


struct PeekNetworkService: NetworkService {
    
    let networkClient: NetworkClient
    let encoder: JSONEncoder

    
//    MARK: - lifecycle
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
        self.encoder = .init()
    }
    
    
//    MARK: exposed func
    func getHeader(accessToken: String? = nil) -> [String : String] {
        var headers: [String: String] = [:]
        headers["Content-Type"] = "application/json"
        headers["language"] = "EN"
        
        if let accessToken = accessToken {
            headers["access-token"] = accessToken
        }
        
        headers["platform"] = "iOS"
        headers["client_version"] = "10000"
        
        return headers
    }
    
}


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
