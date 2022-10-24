//
//  EntranceModulePresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.10.2022.
//

import UIKit


final class EntranceModulePresenter {
    
    var entrancePage: EntrancePage
    var authorizedPage: AuthorizedPage
    var unAuthorizedPage: LoginPage
    
    var appCoordinator: AppCoordinator?
    var passwordPage: PasswordPage
    var registerPage: RegisterPage
    var waitingPage: WaitingPage
    
    var isLoggedIn: Bool {
        get {
            let username = UserDefaults.standard.string(forKey: Constants.usernameKey) ?? ""
            let password = UserDefaults.standard.string(forKey: Constants.passwordKey) ?? ""
            return !password.isEmpty && !username.isEmpty
        }
    }
    
    init(entrancePage: EntrancePage,
         authorizedPage: AuthorizedPage,
         unAuthorizedPage: LoginPage,
         passwordPage: PasswordPage,
         registerPage: RegisterPage,
         waitingPage: WaitingPage) {
        self.entrancePage = entrancePage
        self.authorizedPage = authorizedPage
        self.unAuthorizedPage = unAuthorizedPage
        self.passwordPage = passwordPage
        self.registerPage = registerPage
        self.waitingPage = waitingPage
    }
    
    private func pushViewController(with viewController: UIViewController?) {
        let viewController = viewController ?? (isLoggedIn ? authorizedPage : unAuthorizedPage)
        entrancePage.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func popCurrentViewController() {
        entrancePage.navigationController?.popViewController(animated: true)
    }
    
    private func userAuthorized() {
        entrancePage.navigationController?.popToRootViewController(animated: true)
        pushViewController(with: authorizedPage)
    }
    
    private func userUnAuthorized() {
        entrancePage.navigationController?.popToRootViewController(animated: true)
        pushViewController(with: unAuthorizedPage)
    }
    
}


// MARK: -- ⬇️ EXTENSIONS ⬇️

extension EntranceModulePresenter {
    enum Constants {
        static let usernameKey: String = "UsernameKey"
        static let passwordKey: String = "PasswordKey"
    }
}

extension EntranceModulePresenter: EntrancePagePresenter {
    func pushEntrancePage() {
        pushViewController(with: nil)
    }
}

extension EntranceModulePresenter: LoginPagePresenter {
    func checkUsername(with username: String) {
        if username == "Ezpzbaby" {
            pushViewController(with: passwordPage)
        } else {
            unAuthorizedPage.setInputFieldWith(with: false)
        }
    }
    
    func openRegisterPage() {
        pushViewController(with: registerPage)
    }
}

extension EntranceModulePresenter: PasswordPagePresenter {
    func checkPassword(with password: String) {
        if password == "Password" {
            userAuthorized()
        } else {
            passwordPage.setInputFieldWith(with: false)
        }
    }
}

extension EntranceModulePresenter: RegisterPagePresenter {
    func checkRegistrationData(with id: PeekID) {
        if id.username == "Ezpzbaby" {
            userAuthorized()
        } else {
            registerPage.setInputFieldsState(with: false)
        }
    }
}

extension EntranceModulePresenter: AuthorizedPagePresenter {
    func pushWaitingRoom(with roomId: String, isAdmin: Bool) {
        print("push waiting room")
        waitingPage.setInitialData(roomId: roomId, isAdmin: isAdmin)
        pushViewController(with: waitingPage)
    }
    
    func logOut() {
        print("Log out")
        userUnAuthorized()
    }
}

extension EntranceModulePresenter: WaitingRoomPresenter {
    func cancelWaiting() {
        popCurrentViewController()
    }
    
    func startTheSession(with roomId: String) {
        print("Start the seesion \(roomId)")
        appCoordinator?.setSessionModule()
    }
}
