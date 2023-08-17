//
//  ExtensionWaitingPagePresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 08.11.2022.
//

import UIKit

extension EntranceModulePresenter: WaitingRoomPresenter {
    func cancelWaiting(didAdminClose: Bool = false) {
        if let username = UserDefaults.standard.string(forKey: GConstants.usernameKey) {
            if isAdmin {
                sendSocket(message: "Room closed")
            } else {
                sendSocket(message: "Left \(username)")
            }
        }
        closeSocket()
        appCoordinator?.popCurrentViewController()
        if !self.isAdmin && didAdminClose { authorizedPage.isAdminOut = true }
    }
    
    func startTheSession() {
        sendSocket(message: "Room started")
        closeSocket(isRoomStarded: true)
        appCoordinator?.sessionStarted()
    }
    
    func getIsAdmin() -> Bool {
        isAdmin
    }
    
    func getRoomMembers() -> [String] {
        var u = roomMembers
        if let idx = u.firstIndex(of: roomAdmin) { u.remove(at: idx) }
        return [roomAdmin] + u
    }
}



