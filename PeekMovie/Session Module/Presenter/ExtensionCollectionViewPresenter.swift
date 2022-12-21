//
//  ExtensionCollectionViewPresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 23.11.2022.
//

import UIKit

extension SessionModulePresenter: CollectionViewDelegate {
    func getDataAmount() -> Int {
        likedMovies.count
    }
    
    func getItem(at: Int) -> MovieDTO {
        likedMovies[at]
    }
    
    func quitFromRoom() {
        guard
            let token = UserDefaults.standard.string(forKey: GConstants.tokenKey),
            let roomId = UserDefaults.standard.string(forKey: GConstants.roomIdKey) else {
                
                return
        }
        networkService.quitFromRoom(credentials: (TokenDTO(token: token), roomId)) { [weak self] result in
            switch result {
            case .success(let response):
                if let data = response.data {
                    print(data)
                    self?.closeSocket(isRoomStarded: false)
                    self?.appCoordinator?.quitFromRoom()
                } else if let error = response.error {
                    print(error.error_message)
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}
