//
//  registerNSE.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 16.08.2023.
//

import Foundation

extension NetworkServiceImplementation {
    @discardableResult
    func register(
        credentials: RegistrationFormDTO,
        completion: @escaping (Result<ResponseDTO<TokenDTO>, HTTPError>) -> Void
    ) -> Cancellable? {
        networkClient.processRequest(
            request: createRegistrationRequest(credentials: credentials),
            completion: completion
        )
    }
    
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
    
}
