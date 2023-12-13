//
//  NetworkService.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.12.2023.
//

import Foundation



struct SignInCredentials: Encodable {
    
}

struct PeekUserResponse: Decodable {
    
}

struct PeekUser {
    
}


protocol NetworkService {
    
    @discardableResult
    func signIn(credentials: SignInCredentials) async throws -> PeekUserResponse
    
}
