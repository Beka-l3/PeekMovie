//
//  AppCoordinator.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 10.10.2022.
//

import Foundation
import UIKit


protocol AppCoordinatorDelegate {
    func setModule(view: UIViewController)
}


final class AppCoordinator {
    
    var appDelegate: AppCoordinatorDelegate?
    var entranceModule: EntranceModuleBuilder
    var sessionModule: SessionModuleBuilder
    
    var isLoggedIn: Bool {
        get {
            let username = UserDefaults.standard.string(forKey: Constants.usernameKey) ?? ""
            let password = UserDefaults.standard.string(forKey: Constants.passwordKey) ?? ""
            
            return !password.isEmpty && !username.isEmpty
        }
    }
    
    init() {
        self.entranceModule = EntranceModuleBuilder()
        self.sessionModule = SessionModuleBuilder()
        
        entranceModule.appCoordinator = self
        entranceModule.presenter.appCoordinator = self
    }
    
    func setSessionModule() {
        print("Set session module")
        appDelegate?.setModule(view: sessionModule.view)
    }
    
    func setEntranceModule() {
        print("Set session module")
        appDelegate?.setModule(view: entranceModule.view)
    }
}

extension AppCoordinator: AppDelegateEntrancePage {
    func getEntrancePage() -> UIViewController {
        return entranceModule.view
//        return sessionModule.view
    }
}


extension AppCoordinator {
    enum Constants {
        static let usernameKey: String = "UsernameKey"
        static let passwordKey: String = "PasswordKey"
    }
}
