//
//  ErrorDTO.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 05.11.2022.
//

import Foundation


struct ErrorDTO: Decodable {
    let error_message: String
}

enum ErrorMessage {
    static let username = "Invalid username"
    static let email = "Invalid email"
    static let password = "Invalid password"
}
