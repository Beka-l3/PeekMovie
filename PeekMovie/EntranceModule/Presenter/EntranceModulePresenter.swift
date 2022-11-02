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
    
    private let authorizedPage: AuthorizedPage
    private let unAuthorizedPage: LoginPage
    private let passwordPage: PasswordPage
    private let registerPage: RegisterPage
    private let waitingPage: WaitingPage
    private let networkService: NetworkService
    
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
    }
    
    func getEntrancePage(isLoggedIn: Bool) -> UIViewController {
        return isLoggedIn ? authorizedPage : unAuthorizedPage
    }
}


// MARK: -- ⬇️ EXTENSIONS ⬇️
extension EntranceModulePresenter: LoginPagePresenter {
    func checkUsername(with username: String) {
        networkService.checkUsername(
            credentials: PeekID(
                username: username,
                password: ""
            )
        ) { [weak self] result in
            guard let self = self else {
                self?.unAuthorizedPage.somethingWentWrong()
                return
            }

            switch result {
            case .success(let str):
                print(str)
                UserDefaults.standard.set(username, forKey: GConstants.usernameKey)
                self.appCoordinator?.pushViewController(with: self.passwordPage, popToRoot: false)
            case .failure(let error):
                print(error)
                self.unAuthorizedPage.setInputFieldWith(with: false)
            }
        }
        
//        if username == "Ezpzbaby" {
//            appCoordinator?.pushViewController(with: passwordPage, popToRoot: false)
//        } else {
//            unAuthorizedPage.setInputFieldWith(with: false)
//        }
    }
    
    func openRegisterPage() {
        appCoordinator?.pushViewController(with: registerPage, popToRoot: false)
    }
}

extension EntranceModulePresenter: PasswordPagePresenter {
    func checkPassword(with password: String) {
        guard let username = UserDefaults.standard.string(forKey: GConstants.usernameKey) else {
            registerPage.somethingWentWrong()
            DispatchQueue.global().async { [weak self] in
                sleep(3)
                DispatchQueue.main.async {
                    self?.appCoordinator?.popCurrentViewController()
                }
            }
            return
        }

        networkService.login(
            credentials: PeekID(
                username: username,
                password: password
            )
        ) { [weak self] result in
            guard let self = self else {
                self?.passwordPage.somethingWentWrong()
                return
            }

            switch result {
            case .success(let token):
                UserDefaults.standard.set(password, forKey: GConstants.passwordKey)
                UserDefaults.standard.set(token.token, forKey: GConstants.tokenKey)
                self.appCoordinator?.pushViewController(with: self.authorizedPage, popToRoot: true)
            case .failure(let error):
                print(error)
                self.passwordPage.setInputFieldWith(with: false)
            }
        }
        
//        if password == "Password" {
//            appCoordinator?.pushViewController(with: authorizedPage, popToRoot: true)
//        } else {
//            passwordPage.setInputFieldWith(with: false)
//        }
    }
}

extension EntranceModulePresenter: RegisterPagePresenter {
    func checkRegistrationData(with form: RegistrationFormDTO) {
        networkService.register(credentials: form) { [weak self] result in
            guard let self = self else {
                self?.registerPage.somethingWentWrong()
                return
            }
            
            switch result {
            case .success(let token):
                print(token)
                UserDefaults.standard.set(token.token, forKey: GConstants.tokenKey)
                self.appCoordinator?.pushViewController(with: self.authorizedPage, popToRoot: true)
            case .failure(let error):
                print(error)
                self.registerPage.setInputFieldsState(with: false)
            }
        }
        
        
//        if form.username == "Ezpzbaby" {
//            appCoordinator?.pushViewController(with: authorizedPage, popToRoot: true)
//        } else {
//            registerPage.setInputFieldsState(with: false)
//        }
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
