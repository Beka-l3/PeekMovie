//
//  NetworkService.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.12.2023.
//

import Foundation


protocol NetworkService {
    
    
//    MARK: Authorization
    @discardableResult
    func signIn(credentials: SignInCredentials) async throws -> PeekUserResponse
    
    @discardableResult
    func signUp(credentials: SignUpCredentials) async throws -> PeekUserResponse
    
    
//    MARK: Restore Password
    @discardableResult
    func restorePasswordByEmail(credentials: RestorePasswordByEmailCredentials) async throws -> EmptyResponse
    
    @discardableResult
    func restorePasswordSendVerificationCode(credentials: RestorePasswordSendVerificationCodeCredentials) async throws -> EmptyResponse
    
    @discardableResult
    func restorePassword(credentials: RestorePasswordCredentials) async throws -> EmptyResponse
    
    
}


struct EmptyResponse: Decodable { }
