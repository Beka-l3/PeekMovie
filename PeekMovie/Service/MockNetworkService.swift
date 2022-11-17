//
//  MockNetworkService.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 09.11.2022.
//

import UIKit

final class MockNetworkService: NetworkService {
    private static func executeCompletionOnMainThread(_ closure: @escaping () -> Void) {
        DispatchQueue.main.async {
            closure()
        }
    }
    
    func register(
        credentials: RegistrationFormDTO,
        completion: @escaping (Result<ResponseDTO<TokenDTO>, HTTPError>) -> Void
    ) -> Cancellable? {
        DispatchQueue.global().async {
            sleep(UInt32.random(in: 0...3))
            if Int.random(in: 0...99) == 0 {
                MockNetworkService.executeCompletionOnMainThread {
                    completion(.failure(.decodingFailed))
                }
            } else {
                if Int.random(in: 0...49) == 0 {
                    let error_message = [ErrorMessage.username, ErrorMessage.email, ErrorMessage.password]
                    let error = ErrorDTO(error_message: error_message.randomElement()!)
                    MockNetworkService.executeCompletionOnMainThread {
                        completion(.success(ResponseDTO(data: nil, error: error)))
                    }
                } else {
                    let token = TokenDTO(token: UUID().uuidString)
                    MockNetworkService.executeCompletionOnMainThread {
                        completion(.success(ResponseDTO(data: token, error: nil)))
                    }
                }
            }
        }
        
        return nil
    }
    
    func login(
        credentials: PeekID,
        completion: @escaping (Result<ResponseDTO<TokenDTO>, HTTPError>) -> Void
    ) -> Cancellable? {
        DispatchQueue.global().async {
            sleep(UInt32.random(in: 0...3))
            if Int.random(in: 0...99) == 0 {
                MockNetworkService.executeCompletionOnMainThread {
                    completion(.failure(.decodingFailed))
                }
            } else {
                if Int.random(in: 0...49) == 0 {
                    let error_message = [ErrorMessage.username, ErrorMessage.password]
                    let error = ErrorDTO(error_message: error_message.randomElement()!)
                    MockNetworkService.executeCompletionOnMainThread {
                        completion(.success(ResponseDTO(data: nil, error: error)))
                    }
                } else {
                    let token = TokenDTO(token: UUID().uuidString)
                    MockNetworkService.executeCompletionOnMainThread {
                        completion(.success(ResponseDTO(data: token, error: nil)))
                    }
                }
            }
        }
        return nil
    }
    
    func checkUsername(
        credentials: PeekID,
        completion: @escaping (Result<ResponseDTO<String>, HTTPError>) -> Void
    ) -> Cancellable? {
        DispatchQueue.global().async {
            sleep(UInt32.random(in: 0...3))
            if Int.random(in: 0...99) == 0 {
                MockNetworkService.executeCompletionOnMainThread {
                    completion(.failure(.decodingFailed))
                }
            } else {
                if Int.random(in: 0...49) == 0 {
                    let error = ErrorDTO(error_message: ErrorMessage.username)
                    MockNetworkService.executeCompletionOnMainThread {
                        completion(.success(ResponseDTO(data: nil, error: error)))
                    }
                } else {
                    MockNetworkService.executeCompletionOnMainThread {
                        completion(.success(ResponseDTO(data: "Success", error: nil)))
                    }
                }
            }
        }
        return nil
    }
    
    func createRoom(
        credentials: TokenDTO,
        completion: @escaping (Result<ResponseDTO<RoomDTO>, HTTPError>) -> Void
    ) -> Cancellable? {
        DispatchQueue.global().async {
            sleep(UInt32.random(in: 0...3))
            let alph = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            var roomId = ""
            for _ in 0...5 { roomId.append(alph.randomElement()!) }
            MockNetworkService.executeCompletionOnMainThread {
                let admin = UserDefaults.standard.string(forKey: GConstants.usernameKey) ?? "ezpzbaby"
                completion(.success(ResponseDTO(data: RoomDTO(roomId: roomId, admin: admin, users: []), error: nil)))
            }
        }
        return nil
    }
    
    func joinRoom(
        credentials: (token: TokenDTO, roomId: String),
        completion: @escaping (Result<ResponseDTO<RoomDTO>, HTTPError>) -> Void
    ) -> Cancellable? {
        DispatchQueue.global().async {
            sleep(UInt32.random(in: 0...3))
            if Int.random(in: 0...99) == 0 {
                MockNetworkService.executeCompletionOnMainThread {
                    completion(.failure(.decodingFailed))
                }
            } else {
                if Int.random(in: 0...49) == 0 {
                    let error = ErrorDTO(error_message: ErrorMessage.username)
                    MockNetworkService.executeCompletionOnMainThread {
                        completion(.success(ResponseDTO(data: nil, error: error)))
                    }
                } else {
                    let usersnames = ["Jake", "Beka", "Kamilka", "Asan", "Berik", "Shaxa", "Ersik", "Ulan", "Zhango", "Asya", "Zhanat", "Rohn", "Dona", "Seka", "Madi", "Tolik"]
                    let admin = usersnames.randomElement()!
                    var users: [String] = []
                    for i in Int.random(in: 0...usersnames.count/2)...Int.random(in: usersnames.count/2..<usersnames.count) { users.append(usersnames[i]) }
                    if !users.contains(admin) { users.append(admin) }
                    print(admin, users)
                    let roomData = RoomDTO(roomId: credentials.roomId, admin: admin, users: users)
                    
                    MockNetworkService.executeCompletionOnMainThread {
                        completion(.success(ResponseDTO<RoomDTO>(data: roomData, error: nil)))
                    }
                }
            }
        }
        
        return nil
    }
    
    @discardableResult
    func getMovie(
        credentials: (token: TokenDTO, roomId: String),
        completion: @escaping (Result<MovieDTO, HTTPError>) -> Void
    ) -> Cancellable? {
        
        return nil
    }
    
}
