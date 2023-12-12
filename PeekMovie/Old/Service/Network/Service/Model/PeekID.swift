//
//  PeekID.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 14.10.2022.
//

enum PeekIDRegistrationError: Error {
    case username, email, password
}

struct PeekID {
    let username: String
    let password: String
}
