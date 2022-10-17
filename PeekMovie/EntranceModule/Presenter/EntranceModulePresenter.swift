//
//  EntranceModulePresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.10.2022.
//

import UIKit


class EntranceModulePresenter {
    
    var entrancePage: EntrancePage
    var authorizedPage: AuthorizedPageController
    var unAuthorizedPage: LoginPage
    var isLoggedIn: Bool
    
    var appCoordinator: AppCoordinator?
    var passwordPage: PasswordPage
    var registerPage: RegisterPageController
    
    init(entrancePage: EntrancePage,
         authorizedPage: AuthorizedPageController,
         unAuthorizedPage: LoginPage,
         isLoggedIn: Bool,
         passwordPage: PasswordPage,
         registerPage: RegisterPageController) {
        self.entrancePage = entrancePage
        self.authorizedPage = authorizedPage
        self.unAuthorizedPage = unAuthorizedPage
        self.isLoggedIn = isLoggedIn
        self.passwordPage = passwordPage
        self.registerPage = registerPage
    }
    
    private func pushViewController(with viewController: UIViewController?) {
        let viewController = viewController == nil ? (isLoggedIn ? authorizedPage : unAuthorizedPage) : viewController!
        entrancePage.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func userAuthorized() {
        entrancePage.navigationController?.popToRootViewController(animated: true)
        pushViewController(with: authorizedPage)
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
