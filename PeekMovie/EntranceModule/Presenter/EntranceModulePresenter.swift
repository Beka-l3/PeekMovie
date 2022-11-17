//
//  EntranceModulePresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.10.2022.
//

import UIKit


protocol EntranceModuleDelegate {
    func pushViewController(with vc: UIViewController, popToRoot: Bool)
    func popCurrentViewController()
    func sessionStarted()
}

final class EntranceModulePresenter: NSObject {
    var appCoordinator: EntranceModuleDelegate?
    
    internal let authorizedPage: AuthorizedPage
    internal let unAuthorizedPage: LoginPage
    internal let passwordPage: PasswordPage
    internal let registerPage: RegisterPage
    internal let waitingPage: WaitingPage
    internal let networkService: NetworkService
    
    internal var isAdmin: Bool
    internal var roomAdmin: String
    internal var roomMembers: [String]
    
    internal var webSocket: URLSessionWebSocketTask?
    
    init(
        authorizedPage: AuthorizedPage,
        unAuthorizedPage: LoginPage,
        passwordPage: PasswordPage,
        registerPage: RegisterPage,
        waitingPage: WaitingPage,
        networkService: NetworkService
    ) {
        self.authorizedPage = authorizedPage
        self.unAuthorizedPage = unAuthorizedPage
        self.passwordPage = passwordPage
        self.registerPage = registerPage
        self.waitingPage = waitingPage
        self.networkService = networkService
        
        self.isAdmin = false
        self.roomAdmin = ""
        self.roomMembers = []
    }
    
    func getEntrancePage(isLoggedIn: Bool) -> UIViewController {
        return isLoggedIn ? authorizedPage : unAuthorizedPage
    }
    
    internal func setInitialRoomData(roomData: RoomDTO, isAdmin: Bool) {
        self.isAdmin = isAdmin
        self.roomAdmin = roomData.admin
        self.roomMembers = roomData.users
        
        waitingPage.setInitialData(roomData: roomData, isAdmin: isAdmin)
    }
}

