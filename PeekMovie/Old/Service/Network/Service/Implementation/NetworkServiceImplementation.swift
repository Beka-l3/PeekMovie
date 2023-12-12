//
//  NetworkServiceClient.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 01.11.2022.
//

import Foundation


final class NetworkServiceImplementation: NetworkService {
        
    internal let networkClient: NetworkClient

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
}
