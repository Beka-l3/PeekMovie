//
//  NetworkServiceClient.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 01.11.2022.
//

import Foundation


final class NetworkServiceImplementation: NetworkServiceOLD {
        
    internal let networkClient: NetworkClientOLD

    init(networkClient: NetworkClientOLD) {
        self.networkClient = networkClient
    }
}
