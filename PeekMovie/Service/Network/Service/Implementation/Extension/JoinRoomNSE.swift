//
//  JoinRoomNSE.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 16.08.2023.
//

import Foundation

extension NetworkServiceImplementation {
    
    @discardableResult
    func joinRoom(
        credentials: (token: TokenDTO, roomId: String),
        completion: @escaping (Result<ResponseDTO<RoomDTO>, HTTPError>) -> Void
    ) -> Cancellable? {
        networkClient.processRequest(
            request: createJoinRoomRequest(token: credentials.token, roomId: credentials.roomId),
            completion: completion
        )
    }
    
    private func createJoinRoomRequest(token: TokenDTO, roomId: String) -> HTTPRequest {
        HTTPRequest(
            route: "http://.../createRoom",
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
