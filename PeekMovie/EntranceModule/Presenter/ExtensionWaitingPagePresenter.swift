//
//  ExtensionWaitingPagePresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 08.11.2022.
//

import UIKit

extension EntranceModulePresenter: WaitingRoomPresenter {
    func cancelWaiting(isAdmin: Bool, didAdminClose: Bool = false) {
        appCoordinator?.popCurrentViewController()
        if !isAdmin && didAdminClose { authorizedPage.isAdminOut = true }
    }
    
    func startTheSession(with roomId: String) {
        appCoordinator?.sessionStarted()
    }
}

