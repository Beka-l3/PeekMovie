//
//  APIService.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.08.2023.
//

import Foundation


final class APIService {
    
    public var isMockingAll: Bool = false
    
    
    
//    MARK: lifecycle
    init() {

    }
    
}


extension APIService {
    public enum ServiceError: Error {
        case noAccessToken
        case unknownResponse, internalError
        case imageComressionError, jsonEncodingFailed
    }
}

