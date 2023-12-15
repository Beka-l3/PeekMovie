//
//  AppCoordinator+AuthorizationDelegate.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 15.12.2023.
//

import UIKit


extension AppCoordinator: AuthorizationDelegate {
    func loggedIn() {
        do {
            
            try lobbyModule.lobbyPage.prepareLobby()
            moduleToShow = .lobby
            
        } catch {
            
            print("Prepare Lobby page error: \(error)")
            
        }
    }
}
