//
//  ExtensionRegisterPagePresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 08.11.2022.
//

import UIKit

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
//                    switch error {
//                    case "Username":
//                        self.registerPage.popInfoLabel(type: .incorrectInput(input: .username))
//                    case "Email":
//                        self.registerPage.popInfoLabel(type: .incorrectInput(input: .email))
//                    case "Password":
//                        self.registerPage.popInfoLabel(type: .incorrectInput(input: .password))
//                    }
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
            registerPage.popInfoLabel(type: .incorrectInput(input: .username))
        }
    }
}

