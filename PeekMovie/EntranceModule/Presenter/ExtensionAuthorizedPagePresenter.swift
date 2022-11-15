//
//  ExtensionAuthorizedPagePresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 08.11.2022.
//

import UIKit

extension EntranceModulePresenter: AuthorizedPagePresenter {    
    func createRoom() {
        guard let token = UserDefaults.standard.string(forKey: GConstants.tokenKey) else {
            authorizedPage.popInfoLabel(type: .internalError) { [weak self] in
                self?.logOut()
            }
            return
        }
        
        networkService.createRoom(
            credentials: TokenDTO(token: token)
        ) { [weak self] result in
            guard let self = self else {
                self?.authorizedPage.popInfoLabel(type: .internalError)
                return
            }
            
            switch result {
            case .success(let result):
                if let data = result.data {
                    self.waitingPage.setupWebSocket()
                    UserDefaults.standard.set(data.roomId, forKey: GConstants.roomIdKey)
                    self.waitingPage.setInitialData(roomData: data, isAdmin: true)
                    self.appCoordinator?.pushViewController(with: self.waitingPage, popToRoot: false)
                } else {
                    self.authorizedPage.popInfoLabel(type: .serverError)
                }
            case .failure(let error):
                print(error)
                self.authorizedPage.popInfoLabel(type: .internalError)
            }
            
        }
    }
    
    func joinRoom(with roomId: String) {
        guard let token = UserDefaults.standard.string(forKey: GConstants.tokenKey) else {
            authorizedPage.popInfoLabel(type: .internalError) { [weak self] in
                self?.logOut()
            }
            return
        }
        
        networkService.joinRoom(
            credentials: (TokenDTO(token: token), roomId: roomId)
        ) { [weak self] result in
            guard let self = self else {
                self?.authorizedPage.popInfoLabel(type: .internalError)
                return
            }
            
            switch result {
            case .success(let result):
                if let data = result.data {
                    self.waitingPage.setupWebSocket()
                    UserDefaults.standard.set(roomId, forKey: GConstants.roomIdKey)
                    self.waitingPage.setInitialData(roomData: data, isAdmin: false)
                    self.appCoordinator?.pushViewController(with: self.waitingPage, popToRoot: false)
                } else if let error = result.error {
                    print(error.error_message)
                    self.authorizedPage.popInfoLabel(type: .incorrectInput(input: .roomId))
                } else {
                    self.authorizedPage.popInfoLabel(type: .serverError)
                }
            case .failure(let error):
                print(error)
                self.authorizedPage.popInfoLabel(type: .internalError)
            }
        }
    }
    
    func logOut() {
        UserDefaults.standard.removeObject(forKey: GConstants.usernameKey)
        UserDefaults.standard.removeObject(forKey: GConstants.passwordKey)
        UserDefaults.standard.removeObject(forKey: GConstants.tokenKey)
        appCoordinator?.pushViewController(with: unAuthorizedPage, popToRoot: true)
    }
}
