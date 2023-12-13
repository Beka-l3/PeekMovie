//
//  NetworkClientProtocol.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.12.2023.
//

import Foundation


protocol NetworkClient {
    
    func processRequest<T: Decodable>( request: HTTPRequest ) async throws -> T
    
}
