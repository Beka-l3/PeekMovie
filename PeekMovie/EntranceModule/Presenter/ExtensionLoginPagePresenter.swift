//
//  ExtensionAuthorizedPagePresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 08.11.2022.
//

import UIKit

extension EntranceModulePresenter: LoginPagePresenter {
    func checkUsername(with username: String) {
        networkService.checkUsername(
            credentials: PeekID(
                username: username,
                password: ""
            )
        ) { [weak self] result in
            guard let self = self else {
                self?.unAuthorizedPage.popInfoLabel(type: .unknown)
                return
            }

            switch result {
            case .success(let response):
                if let data = response.data {
                    UserDefaults.standard.set(username, forKey: GConstants.usernameKey)
                    self.appCoordinator?.pushViewController(with: self.passwordPage, popToRoot: false)
                } else if let error = response.error {
                    print(error)
                    self.unAuthorizedPage.popInfoLabel(type: .incorrectInput(input: .username))
                } else {
                    print("Server response error")
                    self.unAuthorizedPage.popInfoLabel(type: .serverError)
                }

            case .failure(let error):
                print(error)
                self.unAuthorizedPage.popInfoLabel(type: .internalError)
            }
        }
        
//        if username == "Ezpzbaby" {
//            appCoordinator?.pushViewController(with: passwordPage, popToRoot: false)
//        } else {
//            unAuthorizedPage.popInfoLabel(type: .incorrectInput(input: .username))
//        }
    }
    
    func openRegisterPage() {
        appCoordinator?.pushViewController(with: registerPage, popToRoot: false)
    }
}
