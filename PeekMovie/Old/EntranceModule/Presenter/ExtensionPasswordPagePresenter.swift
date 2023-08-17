//
//  ExtensionPasswordPagePresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 08.11.2022.
//

import UIKit

extension EntranceModulePresenter: PasswordPagePresenter {
    func checkPassword(with password: String) {
        guard let username = UserDefaults.standard.string(forKey: GConstants.usernameKey) else {
            registerPage.popInfoLabel(type: .unknown)
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
                self?.passwordPage.popInfoLabel(type: .unknown)
                return
            }

            switch result {
            case .success(let response):
                if let data = response.data {
                    UserDefaults.standard.set(password, forKey: GConstants.passwordKey)
                    UserDefaults.standard.set(data.token, forKey: GConstants.tokenKey)
                    self.appCoordinator?.pushViewController(with: self.authorizedPage, popToRoot: true)
                } else if let error = response.error {
                    print(error)
                    self.passwordPage.popInfoLabel(type: .incorrectInput(input: .password))
                } else {
                    print("Server response error")
                    self.passwordPage.popInfoLabel(type: .serverError)
                }
            case .failure(let error):
                print(error)
                self.passwordPage.popInfoLabel(type: .internalError)
            }
        }
        
//        if password == "Password" {
//            appCoordinator?.pushViewController(with: authorizedPage, popToRoot: true)
//        } else {
//            passwordPage.popInfoLabel(type: .incorrectInput(input: .password))
//        }
    }
}

