//
//  QuitFromRoomNSE.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 16.08.2023.
//

import Foundation

extension NetworkServiceImplementation {
    
    func quitFromRoom(
        credentials: (token: TokenDTO, roomId: String),
        completion: @escaping (Result<ResponseDTO<String>, HTTPError>) -> Void
    ) -> Cancellable? {
        
        return nil
    }
    
    private func createGetMovieRequest(token: TokenDTO, roomId: String) -> HTTPRequest {
        HTTPRequest(
            route: "http://.../getMovie",
            headers: [
                "application/json": "Content-Type",
                "gzip, deflate": "Accept-Encoding",
                token.token: "X-authentication"
            ],
            body: try? JSONSerialization.data(
                withJSONObject: [
                    "roomId": roomId
                ]
            ),
            httpMethod: .post
        )
    }
    
}
