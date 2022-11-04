//
//  MockNetworkService.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 03.11.2022.
//

import Foundation


final class MockNetworkService: NetworkService {
    @discardableResult
    func register(
        credentials: RegistrationFormDTO,
        completion: @escaping (Result<TokenDTO, HTTPError>) -> Void
    ) -> Cancellable? {
        
        
        return nil
    }
    
    @discardableResult
    func login(
        credentials: PeekID,
        completion: @escaping (Result<TokenDTO, HTTPError>) -> Void
    ) -> Cancellable? {
        
        
        return nil
    }
    
    @discardableResult
    func checkUsername(
        credentials: PeekID,
        completion: @escaping (Result<String, HTTPError>) -> Void
    ) -> Cancellable? {
        
        
        return nil
    }
}
