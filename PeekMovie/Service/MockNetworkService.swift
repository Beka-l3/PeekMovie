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
    
    
}
