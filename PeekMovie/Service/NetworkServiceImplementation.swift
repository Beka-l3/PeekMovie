//
//  NetworkServiceClient.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 01.11.2022.
//

import Foundation


final class NetworkServiceImplementation: NetworkService {
    
    private let networkClient: NetworkClient

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
//  MARK: - POST
    @discardableResult
    func register(
        credentials: RegistrationFormDTO,
        completion: @escaping (Result<TokenDTO, HTTPError>) -> Void
    ) -> Cancellable? {
        networkClient.processRequest(
            request: createRegistrationRequest(credentials: credentials),
            completion: completion
        )
    }
    
    
    
    
    
    
//  MARK: - Private methods
    private func createRegistrationRequest(credentials: RegistrationFormDTO) -> HTTPRequest {
        HTTPRequest(
            route: "http://proxyman.local:8080/user/register",
            headers:
            [
                "application/json": "Content-Type",
                "gzip, deflate": "Accept-Encoding"
            ],
            body: try? JSONSerialization.data(
                withJSONObject:
                [
                    "username": credentials.username,
                    "email": credentials.email,
                    "password": credentials.password
                ]
            ),
            httpMethod: .post
        )
    }
}
