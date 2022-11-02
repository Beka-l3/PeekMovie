//
//  RegistrationFormDTO.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 02.11.2022.
//

import Foundation

struct RegistrationFormDTO: Decodable {
    let username: String
    let email: String
    let password: String
}
