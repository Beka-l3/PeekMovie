//
//  CreateRoomNSE.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 16.08.2023.
//

import Foundation

extension NetworkServiceImplementation {
    
    @discardableResult
    func createRoom(
        credentials: TokenDTO,
        completion: @escaping (Result<ResponseDTO<RoomDTO>, HTTPError>) -> Void
    ) -> Cancellable? {
        networkClient.processRequest(
            request: createCreateRoomRequest(credentials: credentials),
            completion: completion
        )
    }
    
    private func createCreateRoomRequest(credentials: TokenDTO) -> HTTPRequest {
        HTTPRequest(
            route: "http://.../createRoom",
            headers: [
                "application/json": "Content-Type",
                "gzip, deflate": "Accept-Encoding",
                credentials.token: "X-authentication"
            ],
            
//            body: try? JSONSerialization.data(
//                withJSONObject: []
//            ),
            
            httpMethod: .post
        )
}
    
}
