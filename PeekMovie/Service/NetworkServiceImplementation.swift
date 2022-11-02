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
    
    @discardableResult
    func login(
        credentials: PeekID,
        completion: @escaping (Result<TokenDTO, HTTPError>) -> Void
    ) -> Cancellable? {
        networkClient.processRequest(
            request: createLoginRequest(credentials: credentials),
            completion: completion
        )
    }
    
    @discardableResult
    func checkUsername(
        credentials: PeekID,
        completion: @escaping (Result<String, HTTPError>) -> Void
    ) -> Cancellable? {
        networkClient.processRequest(
            request: createCheckUsernameRequest(credentials: credentials),
            completion: completion
        )
    }
    
    
    
//  MARK: - Private methods
    private func createRegistrationRequest(credentials: RegistrationFormDTO) -> HTTPRequest {
        HTTPRequest(
            route: "http://proxyman.local:8080/user/register",
            headers: [
                "application/json": "Content-Type",
                "gzip, deflate": "Accept-Encoding"
            ],
            body: try? JSONSerialization.data(
                withJSONObject: [
                    "username": credentials.username,
                    "email": credentials.email,
                    "password": credentials.password
                ]
            ),
            httpMethod: .post
        )
    }
    
    private func createLoginRequest(credentials: PeekID) -> HTTPRequest {
        HTTPRequest(
            route: "http://.../login",
            headers: [
                "application/json": "Content-Type",
                "gzip, deflate": "Accept-Encoding"
            ],
            body: try? JSONSerialization.data(
                withJSONObject: [
                    "username": credentials.username,
                    "password": credentials.password
                ]
            ),
            httpMethod: .post
        )
    }
    
    private func createCheckUsernameRequest(credentials: PeekID) -> HTTPRequest {
        HTTPRequest(
            route: "http://.../checkUsername",
            headers: [
                "application/json": "Content-Type",
                "gzip, deflate": "Accept-Encoding"
            ],
            body: try? JSONSerialization.data(
                withJSONObject: [
                    "username": credentials.username
                ]
            ),
            httpMethod: .post
        )
    }
}
