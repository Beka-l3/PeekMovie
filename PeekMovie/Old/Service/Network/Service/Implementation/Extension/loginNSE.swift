//
//  loginNSE.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 16.08.2023.
//

import Foundation

extension NetworkServiceImplementation {
    
    @discardableResult
    func login(
        credentials: PeekID,
        completion: @escaping (Result<ResponseDTO<TokenDTO>, HTTPError>) -> Void
    ) -> Cancellable? {
        networkClient.processRequest(
            request: createLoginRequest(credentials: credentials),
            completion: completion
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
    
}
