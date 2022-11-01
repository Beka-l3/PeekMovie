//
//  NetworkServiceProtocol.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 01.11.2022.
//

import Foundation


protocol NetworkService: AnyObject {
    
//  MARK: - POST
    @discardableResult
    func register(
        credentials: RegistrationFormDTO,
        completion: @escaping (Result<TokenDTO, HTTPError>) -> Void
    ) -> Cancellable?
    
}
