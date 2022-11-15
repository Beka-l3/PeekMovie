//
//  WaitingPageWebSocketExtension.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 14.11.2022.
//
import Foundation

extension WaitingPage: WebSocketService {
    func setupWebSocket() {
        let pieSocketUrl = "wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self"
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        let url = URL(string: pieSocketUrl)
        webSocket = session.webSocketTask(with: url!)
        webSocket?.resume()
    }
    
    
    func ping(successCompletion: @escaping () -> Void, errorCompletion: @escaping () -> Void) {
        webSocket?.sendPing() { error in
            if let error = error {
                print("Ping error: \(error)")
                errorCompletion()
            } else {
                successCompletion()
            }
        }
    }
    
    func close(isAdmin: Bool, isRoomStarded: Bool = false) {
        if isRoomStarded {
            webSocket?.cancel(with: .goingAway, reason: "Room started".data(using: .utf8 ))
        } else {
            if let username = UserDefaults.standard.string(forKey: GConstants.usernameKey) {
                if isAdmin {
                    send(message: "Room closed")
                } else {
                    send(message: "Left \(username)")
                }
            }
            webSocket?.cancel(with: .goingAway, reason: "User left".data(using: .utf8 ))
        }
    }
    
    func send(message: String = "") {
        webSocket?.send(.string(message)) { error in
            if let error = error {
                print("Send error: \(error)")
                DispatchQueue.main.async {  [weak self] in
                    self?.popInfoLabel(type: .connectionError)
                }
            }
        }
    }
    
    func receive() {
        webSocket?.receive() { [weak self] result in
            switch result{
            case .success(let message):
                switch message {
                case .data(let data):
                    print("Got data: \(data)")
                case .string(let str):
                    let componets = str.components(separatedBy: " ")
                    if componets[0] == "Joined" {
                        DispatchQueue.main.async {  [weak self] in
                            self?.popInfoLabel(type: .userJoin(username: componets[1]))
                        }
                    } else if componets[0] == "Left" {
                        DispatchQueue.main.async {  [weak self] in
                            self?.popInfoLabel(type: .userLeft(username: componets[1]))
                        }
                    } else if componets[0] == "Room" && componets[1] == "started" {
                        DispatchQueue.main.async {  [weak self] in
                            self?.popInfoLabel(type: .roomStart)
                        }
                    } else if componets[0] == "Room" && componets[1] == "closed" {
                        DispatchQueue.main.async {  [weak self] in
                            self?.popInfoLabel(type: .adminOut)
                        }
                    } else {
                        print(str)
                    }
                 default:
                    break
                }
            case .failure(let error):
                print("Receive error: \(error)")
                DispatchQueue.main.async {  [weak self] in
                    self?.popInfoLabel(type: .connectionError)
                }
            }
            
            self?.receive()
        }
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        guard let username = UserDefaults.standard.string(forKey: GConstants.usernameKey) else {return}
        ping() { [weak self] in
            self?.send(message: "Joined \(username)")
        } errorCompletion: {
            DispatchQueue.main.async {  [weak self] in
                self?.popInfoLabel(type: .connectionError)
            }
        }
        receive()
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("did close with \(closeCode)")
    }
}
