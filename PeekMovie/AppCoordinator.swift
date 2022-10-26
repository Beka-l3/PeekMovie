//
//  AppCoordinator.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 10.10.2022.
//

import Foundation
import UIKit


final class AppCoordinator {
    
    private var logoPage: LogoPage
    private var entranceModule: EntranceModuleBuilder
    private var sessionModule: SessionModuleBuilder
        
    init(isLoggedIn: Bool) {
        self.logoPage = LogoPage()
        self.entranceModule = EntranceModuleBuilder(isLoggedIn: isLoggedIn)
        self.sessionModule = SessionModuleBuilder()
        self.logoPage.appCoordinator = self
        
        entranceModule.presenter.appCoordinator = self
        sessionModule.presenter.appCoordinator = self
        
    }
    
    private func popToRootViewController() {
        logoPage.navigationController?.popToRootViewController(animated: true)
    }
    
    private func pushViewController(with vc: UIViewController) {
        logoPage.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func popLast() {
        logoPage.navigationController?.popViewController(animated: true)
    }
    
    private func setEntranceModule() {
        print("Set session module")
        popToRootViewController()
        logoPage.navigationController?.pushViewController(entranceModule.view, animated: true)
    }
    
    private func setSessionModule() {
        print("Set session module")
        popToRootViewController()
        logoPage.navigationController?.pushViewController(sessionModule.view, animated: true)
    }
}

// MARK: -- ⬇️ EXTENSIONS ⬇️

extension AppCoordinator: AppDelegateLogoPage {
    func getLogoPage() -> UIViewController {
        return logoPage
    }
}

extension AppCoordinator: LogoPageDelegate {
    func pushEntrancePage() {
        print("Logo page delegate")
//        setEntranceModule()
        setSessionModule()
    }
}

extension AppCoordinator: EntranceModuleDelegate {
    func pushViewController(with vc: UIViewController, popToRoot: Bool) {
        if popToRoot { popToRootViewController() }
        pushViewController(with: vc)
    }
    
    func popCurrentViewController() {
        popLast()
    }
    
    func sessionStarted() {
        setSessionModule()
    }
}

extension AppCoordinator: SessionModuleDelegate {
    
}
