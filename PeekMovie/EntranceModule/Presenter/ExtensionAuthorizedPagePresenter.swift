//
//  ExtensionAuthorizedPagePresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 08.11.2022.
//

import UIKit

extension EntranceModulePresenter: AuthorizedPagePresenter {
    func pushWaitingRoom(with roomId: String, isAdmin: Bool) {
        if !isAdmin && roomId != "123QWE" {
            authorizedPage.popInfoLabel(type: .incorrectInput(input: .roomId))
        } else {
            waitingPage.setInitialData(roomId: roomId, isAdmin: isAdmin)
            appCoordinator?.pushViewController(with: waitingPage, popToRoot: false)
        }
    }
    
    func logOut() {
        appCoordinator?.pushViewController(with: unAuthorizedPage, popToRoot: true)
    }
}
