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
//        networkService.checkUsername(
//            credentials: PeekID(
//                username: username,
//                password: ""
//            )
//        ) { [weak self] result in
//            guard let self = self else {
//                self?.unAuthorizedPage.popInfoLabel(type: .unknown)
//                return
//            }
//
//            switch result {
//            case .success(let response):
//                if let data = response.data {
//                    print(data)
//                    UserDefaults.standard.set(username, forKey: GConstants.usernameKey)
//                    self.appCoordinator?.pushViewController(with: self.passwordPage, popToRoot: false)
//                } else if let error = response.error {
//                    print(error)
//                    self.unAuthorizedPage.setInputFieldWith(with: false)
//                } else {
//                    print("Server response error")
//                }
//
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        if username == "Ezpzbaby" {
            appCoordinator?.pushViewController(with: passwordPage, popToRoot: false)
        } else {
//            unAuthorizedPage.somethingWentWrong()
            unAuthorizedPage.setInputFieldWith(with: false)
        }
    }
    
    func openRegisterPage() {
        appCoordinator?.pushViewController(with: registerPage, popToRoot: false)
    }
}

extension EntranceModulePresenter: PasswordPagePresenter {
    func checkPassword(with password: String) {
//        guard let username = UserDefaults.standard.string(forKey: GConstants.usernameKey) else {
//            registerPage.popInfoLabel(type: .unknown)
//            DispatchQueue.global().async { [weak self] in
//                sleep(3)
//                DispatchQueue.main.async {
//                    self?.appCoordinator?.popCurrentViewController()
//                }
//            }
//            return
//        }

//        networkService.login(
//            credentials: PeekID(
//                username: username,
//                password: password
//            )
//        ) { [weak self] result in
//            guard let self = self else {
//                self?.passwordPage.somethingWentWrong()
//                return
//            }
//
//            switch result {
//            case .success(let response):
//                if let data = response.data {
//                    UserDefaults.standard.set(password, forKey: GConstants.passwordKey)
//                    UserDefaults.standard.set(data.token, forKey: GConstants.tokenKey)
//                    self.appCoordinator?.pushViewController(with: self.authorizedPage, popToRoot: true)
//                } else if let error = response.error {
//                    print(error)
//                    self.passwordPage.setInputFieldWith(with: false)
//                } else {
//                    print("Server response error")
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        if password == "Password" {
            appCoordinator?.pushViewController(with: authorizedPage, popToRoot: true)
        } else {
            passwordPage.setInputFieldWith(with: false)
        }
    }
}

extension EntranceModulePresenter: RegisterPagePresenter {
    func checkRegistrationData(with form: RegistrationFormDTO) {
        
//        networkService.register(
//            credentials: RegistrationFormDTO(
//                username: form.username,
//                email: form.email,
//                password: form.password
//            )
//        ) { [weak self] result in
//            guard let self = self else {
//                self?.registerPage.popInfoLabel(type: .unknown)
//                return
//            }
//
//            switch result {
//            case .success(let response):
//                if let data = response.data {
//                    UserDefaults.standard.set(form.username, forKey: GConstants.usernameKey)
//                    UserDefaults.standard.set(form.password, forKey: GConstants.passwordKey)
//                    UserDefaults.standard.set(data.token, forKey: GConstants.tokenKey)
//                    self.appCoordinator?.pushViewController(with: self.authorizedPage, popToRoot: true)
//                } else if let error = response.error {
//                    print(error)
//                    self.registerPage.setInputFieldsState(with: false)
//                } else {
//                    print("Server bad response")
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        if form.username == "Ezpzbaby" {
            appCoordinator?.pushViewController(with: authorizedPage, popToRoot: true)
        } else {
            registerPage.setInputFieldsState(with: false)
        }
    }
}

extension EntranceModulePresenter: AuthorizedPagePresenter {
    func pushWaitingRoom(with roomId: String, isAdmin: Bool) {
        if !isAdmin && roomId != "Q1WE23" {
            authorizedPage.popInfoLabel(type: .incorrectInput)
            authorizedPage.setInputFieldWith(with: false)
        } else {
            waitingPage.setInitialData(roomId: roomId, isAdmin: isAdmin)
            appCoordinator?.pushViewController(with: waitingPage, popToRoot: false)
        }
        
    }
    
    func logOut() {
        appCoordinator?.pushViewController(with: unAuthorizedPage, popToRoot: true)
    }
}

extension EntranceModulePresenter: WaitingRoomPresenter {
    func cancelWaiting(isAdmin: Bool) {
        appCoordinator?.popCurrentViewController()
    }
    
    func startTheSession(with roomId: String) {
        appCoordinator?.sessionStarted()
    }
}
