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
        completion: @escaping (Result<ResponseDTO<TokenDTO>, HTTPError>) -> Void
    ) -> Cancellable?
    
    @discardableResult
    func login(
        credentials: PeekID,
        completion: @escaping (Result<ResponseDTO<TokenDTO>, HTTPError>) -> Void
    ) -> Cancellable?
    
    @discardableResult
    func checkUsername(
        credentials: PeekID,
        completion: @escaping (Result<ResponseDTO<String>, HTTPError>) -> Void
    ) -> Cancellable?
    
    @discardableResult
    func createRoom(
        credentials: TokenDTO,
        completion: @escaping (Result<ResponseDTO<RoomDTO>, HTTPError>) -> Void
    ) -> Cancellable?
    
    @discardableResult
    func joinRoom(
        credentials: (token: TokenDTO, roomId: String),
        completion: @escaping (Result<ResponseDTO<RoomDTO>, HTTPError>) -> Void
    ) -> Cancellable?
}


protocol WebSocketService: URLSessionWebSocketDelegate {
    var webSocket: URLSessionWebSocketTask? {get set}
    
    func setupWebSocket()
    func ping(successCompletion: @escaping () -> Void, errorCompletion: @escaping () -> Void)
    func close(isAdmin: Bool, isRoomStarded: Bool)
    func send(message: String)
    func receive()
}
