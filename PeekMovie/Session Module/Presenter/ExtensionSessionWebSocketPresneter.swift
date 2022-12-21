//
//  ExtensionSessionWebSocketPresneter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 28.11.2022.
//

import Foundation


extension SessionModulePresenter: WebSocketService {
    func setupWebSocket() {
        let pieSocketUrl = "wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self"
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        let url = URL(string: pieSocketUrl)
        webSocket = session.webSocketTask(with: url!)
        webSocket?.resume()
    }
    
    func pingSocket(successCompletion: @escaping () -> Void, errorCompletion: @escaping () -> Void) {
        webSocket?.sendPing() { error in
            if let error = error {
                print("Ping error: \(error)")
                errorCompletion()
            } else {
                successCompletion()
            }
        }
    }
    
    func closeSocket(isRoomStarded: Bool) {
        let reason = isRoomStarded ? "Room started" : "User left" // "Room closed"
        webSocket?.cancel(with: .goingAway, reason: reason.data(using: .utf8 ))
    }
    
    func sendSocket(message: String) {
        webSocket?.send(.string(message)) { error in
            if let _ = error {
                DispatchQueue.main.async {  [weak self] in
                    self?.mainPage.popInfoLabel(type: .connectionError)
//                    self?.secondaryPage.popInfoLabel(type: .connectionError)
                }
            }
        }
    }
    
    func receiveSocket() {
        webSocket?.receive() { [weak self] result in
            switch result{
            case .success(let message):
                switch message {
                case .data(let data):
                    print("Got data: \(data)")
                case .string(let str):
                    self?.decomposeMessage(str: str)
                default:
                    break
                }
            case .failure(let error):
                print("Receive error: \(error)")
                DispatchQueue.main.async {  [weak self] in
                    self?.mainPage.popInfoLabel(type: .connectionError)
                }
            }
            
            self?.receiveSocket()
        }
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        //guard let username = UserDefaults.standard.string(forKey: GConstants.usernameKey) else {return}
        pingSocket() { //[weak self] in
//            if let isAdmin = self?.isAdmin, isAdmin {
//                self?.sendSocket(message: "Room created")
//            } else {
//                self?.sendSocket(message: "Joined \(username)")
//            }
        } errorCompletion: {
            DispatchQueue.main.async {  [weak self] in
                self?.mainPage.popInfoLabel(type: .connectionError)
            }
        }
        receiveSocket()
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("did close with \(closeCode)")
    }
    
    private func decomposeMessage(str: String) {
        let componets = str.components(separatedBy: " ")
        
    }
}
