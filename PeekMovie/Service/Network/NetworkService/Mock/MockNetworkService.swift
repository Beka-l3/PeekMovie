//
//  MockNetworkService.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 14.12.2023.
//

import Foundation


struct MockNetworkService: NetworkService {
    
    func sleep() async {
        let rndInterval = UInt64.random(in: 0...3)
        
        do {
            try await Task.sleep(nanoseconds: rndInterval * 1_000_000_000)
        } catch {
            print("oops, task sleep failed: mock netwtork service")
        }
    }
    
    
}


extension MockNetworkService {
    
    func signIn(credentials: SignInCredentials) async throws -> PeekUserResponse {
        await sleep()
        
        let response = PeekUserResponse(username: "Example", email: "example@mail.com")
        return response
    }
    
    func signUp(credentials: SignUpCredentials) async throws -> PeekUserResponse {
        await sleep()
        
        let response = PeekUserResponse(username: "Example", email: "example@mail.com")
        return response
    }
    
}
