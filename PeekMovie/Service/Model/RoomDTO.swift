//
//  RoomDTO.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 12.11.2022.
//

import Foundation


struct RoomDTO: Decodable {
    let roomId: String
    let admin: String
    let users: [String]
}
