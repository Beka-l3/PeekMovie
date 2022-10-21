//
//  AppCoordinator.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 10.10.2022.
//

import Foundation
import UIKit



final class AppCoordinator {
    
    var entranceModule: EntranceModuleBuilder?
    
    var isLoggedIn: Bool {
        get {
            let username = UserDefaults.standard.string(forKey: Constants.usernameKey) ?? ""
            let password = UserDefaults.standard.string(forKey: Constants.passwordKey) ?? ""
            
            return !password.isEmpty && !username.isEmpty
        }
    }
    
    init() {}
}

extension AppCoordinator: AppDelegateEntrancePage {
    func getEntrancePage() -> UIViewController {
//        entranceModule = EntranceModuleBuilder(isLoggedIn: isLoggedIn)
        entranceModule = EntranceModuleBuilder(isLoggedIn: true)
        entranceModule?.appCoordinator = self
        guard let entranceModule = entranceModule else {
            return LoginPage()
        }
        
        return entranceModule.view
    }
}


extension AppCoordinator {
    enum Constants {
        static let usernameKey: String = "UsernameKey"
        static let passwordKey: String = "PasswordKey"
    }
}
