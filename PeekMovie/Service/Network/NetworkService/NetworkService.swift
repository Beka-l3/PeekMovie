//
//  NetworkService.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.12.2023.
//

import Foundation


protocol NetworkService {
    
    @discardableResult
    func signIn(credentials: SignInCredentials) async throws -> PeekUserResponse
    
}
