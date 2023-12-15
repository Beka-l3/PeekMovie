//
//  APIService.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.08.2023.
//

import Foundation


struct APIService {
    
    var isMockingAll: Bool
    var networkService: PeekNetworkService
    
    var mockNetworkService: MockNetworkService
    
    
//    MARK: lifecycle
//    init(networkService: PeekNetworkService) {
    init() {
        self.isMockingAll = true
        self.networkService = .init(networkClient: PeekNetworkClient(urlSession: .init(configuration: .default)))
        self.mockNetworkService = .init()
        
    }
    
}


extension APIService {
    public enum ServiceError: Error {
        case noAccessToken
        case unknownResponse, internalError
        case imageComressionError, jsonEncodingFailed
    }
}

