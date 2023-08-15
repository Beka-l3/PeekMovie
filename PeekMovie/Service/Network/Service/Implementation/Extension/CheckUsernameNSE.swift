//
//  CheckUsernameNSE.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 16.08.2023.
//

import Foundation

extension NetworkServiceImplementation {
    
    @discardableResult
    func checkUsername(
        credentials: PeekID,
        completion: @escaping (Result<ResponseDTO<String>, HTTPError>) -> Void
    ) -> Cancellable? {
        networkClient.processRequest(
            request: createCheckUsernameRequest(credentials: credentials),
            completion: completion
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
