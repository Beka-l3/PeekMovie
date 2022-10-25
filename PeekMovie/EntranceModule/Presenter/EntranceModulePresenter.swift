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

final class EntranceModulePresenter {
    var appCoordinator: EntranceModuleDelegate?
    
    private var authorizedPage: AuthorizedPage
    private var unAuthorizedPage: LoginPage
    private var passwordPage: PasswordPage
    private var registerPage: RegisterPage
    private var waitingPage: WaitingPage
    
    init(
        authorizedPage: AuthorizedPage,
        unAuthorizedPage: LoginPage,
        passwordPage: PasswordPage,
        registerPage: RegisterPage,
        waitingPage: WaitingPage) {
        self.authorizedPage = authorizedPage
        self.unAuthorizedPage = unAuthorizedPage
        self.passwordPage = passwordPage
        self.registerPage = registerPage
        self.waitingPage = waitingPage
    }
    
    func getEntrancePage(isLoggedIn: Bool) -> UIViewController {
        return isLoggedIn ? authorizedPage : unAuthorizedPage
    }
}


// MARK: -- ⬇️ EXTENSIONS ⬇️
extension EntranceModulePresenter: LoginPagePresenter {
    func checkUsername(with username: String) {
        if username == "Ezpzbaby" {
            appCoordinator?.pushViewController(with: passwordPage, popToRoot: false)
        } else {
            unAuthorizedPage.setInputFieldWith(with: false)
        }
    }
    
    func openRegisterPage() {
        appCoordinator?.pushViewController(with: registerPage, popToRoot: false)
    }
}

extension EntranceModulePresenter: PasswordPagePresenter {
    func checkPassword(with password: String) {
        if password == "Password" {
            appCoordinator?.pushViewController(with: authorizedPage, popToRoot: true)
        } else {
            passwordPage.setInputFieldWith(with: false)
        }
    }
}

extension EntranceModulePresenter: RegisterPagePresenter {
    func checkRegistrationData(with id: PeekID) {
        if id.username == "Ezpzbaby" {
            appCoordinator?.pushViewController(with: authorizedPage, popToRoot: true)
        } else {
            registerPage.setInputFieldsState(with: false)
        }
    }
}

extension EntranceModulePresenter: AuthorizedPagePresenter {
    func pushWaitingRoom(with roomId: String, isAdmin: Bool) {
        print("push waiting room")
        waitingPage.setInitialData(roomId: roomId, isAdmin: isAdmin)
        appCoordinator?.pushViewController(with: waitingPage, popToRoot: false)
    }
    
    func logOut() {
        print("Log out")
        appCoordinator?.pushViewController(with: unAuthorizedPage, popToRoot: true)
    }
}

extension EntranceModulePresenter: WaitingRoomPresenter {
    func cancelWaiting(isAdmin: Bool) {
        appCoordinator?.popCurrentViewController()
    }
    
    func startTheSession(with roomId: String) {
        print("Start the seesion \(roomId)")
        appCoordinator?.sessionStarted()
    }
}
