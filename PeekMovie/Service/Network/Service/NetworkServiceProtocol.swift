//
//  NetworkServiceProtocol.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 01.11.2022.
//

import Foundation


protocol NetworkService: AnyObject {
    
    @discardableResult
    func signIn(
        credentials: SignInCredentials,
        completion: @escaping (Result<UserResponse, HTTPError>) -> Void
    ) -> Cancellable?
    
    
    
    
    
    
    
    //  MARK: - OLD
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
    
    @discardableResult
    func getMovie(
        credentials: (token: TokenDTO, roomId: String),
        completion: @escaping (Result<ResponseDTO<MovieDTO>, HTTPError>) -> Void
    ) -> Cancellable?
    
    @discardableResult
    func quitFromRoom(
        credentials: (token: TokenDTO, roomId: String),
        completion: @escaping (Result<ResponseDTO<String>, HTTPError>) -> Void
    ) -> Cancellable?
}


protocol WebSocketService: URLSessionWebSocketDelegate {
    var webSocket: URLSessionWebSocketTask? {get set}
    
    func setupWebSocket()
    func pingSocket(successCompletion: @escaping () -> Void, errorCompletion: @escaping () -> Void)
    func closeSocket(isRoomStarded: Bool)
    func sendSocket(message: String)
    func receiveSocket()
}
