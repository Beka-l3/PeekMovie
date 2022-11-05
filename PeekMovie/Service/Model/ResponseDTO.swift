//
//  ResponseDTO.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 05.11.2022.
//

import Foundation


struct ResponseDTO<T>: Decodable where T: Decodable {
    let data: T?
    let error: ErrorDTO?
}
