//
//  Service.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 16.08.2023.
//

import Foundation

struct Service {
    
    static let shared = Service()
    
    static let api = APIService()
    
    static let user = UserService()
    
}
