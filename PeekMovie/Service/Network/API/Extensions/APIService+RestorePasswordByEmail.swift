//
//  APIService+RestorePasswordByEmail.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 18.12.2023.
//

import Foundation


extension APIService {
    
    func  restorePasswordByEmail(credentials: RestorePasswordByEmailCredentials, isMocking: Bool = false) async throws {
        
        let service: NetworkService = (isMocking || isMockingAll) ? mockNetworkService : networkService
        
        do {
            
            try await service.restorePasswordByEmail(credentials: credentials)
            
        } catch {
            
            throw error
            
        }
        
    }
    
}
