//
//  AppCoordinator.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 10.10.2022.
//

import Foundation
import UIKit


final class AppCoordinatorOld {
    
    private let launchPage: LaunchPage
    private let networkClient: NetworkClientOLD
    private let networkService: NetworkServiceOLD
    private let entranceModule: EntranceModuleBuilderOld
    private let sessionModule: SessionModuleBuilderOld
    
    init(isLoggedIn: Bool, launchPage: LaunchPage, networkClient: NetworkClientOLD, networkService: NetworkServiceOLD) {
        self.launchPage = launchPage
        self.networkClient = networkClient
        self.networkService = networkService
        self.entranceModule = EntranceModuleBuilderOld(isLoggedIn: isLoggedIn, networkService: networkService)
        self.sessionModule = SessionModuleBuilderOld(networkService: networkService)
        
        entranceModule.presenter.appCoordinator = self
        sessionModule.presenter.appCoordinator = self
    }
    
    private func popToRootViewController() {
        launchPage.navigationController?.popToRootViewController(animated: true)
    }
    
    private func pushViewController(with vc: UIViewController) {
        launchPage.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func popLast() {
        launchPage.navigationController?.popViewController(animated: true)
    }
    
    private func setEntranceModule() {
        popToRootViewController()
        launchPage.navigationController?.pushViewController(entranceModule.view, animated: true)
    }
    
    private func setSessionModule() {
        popToRootViewController()
        launchPage.navigationController?.pushViewController(sessionModule.view, animated: true)
    }
}

// MARK: -- ⬇️ EXTENSIONS ⬇️
//
//extension AppCoordinator: AppDelegateLogoPage {
//    func pushEntrancePage() {
//        setEntranceModule()
////        setSessionModule()
//    }
//}

extension AppCoordinatorOld: EntranceModuleDelegate {
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

extension AppCoordinatorOld: SessionModuleDelegate {
    func quitFromRoom() {
        setEntranceModule()
    }
}

extension CALayer {
    func pauseLayer() {
        let pausedTime: CFTimeInterval = self.convertTime(CACurrentMediaTime(), from: nil)
        self.speed = .zero
        self.timeOffset = pausedTime
    }

    func resumeLayer() {
        let pausedTime: CFTimeInterval = self.timeOffset
        self.speed = 1.0
        self.timeOffset = .zero
        self.beginTime = .zero
        let timeSincePause: CFTimeInterval = self.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        self.beginTime = timeSincePause
    }
}
