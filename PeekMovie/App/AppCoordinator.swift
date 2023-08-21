//
//  AppCoordinator.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.08.2023.
//

import Foundation

final class AppCoordinator {
    
    let rootViewController: RootViewController
    var entrancemodule: EntranceModuleBuilder?
    
    var didlaunchScreenFinishAnimation: Bool = false {
        didSet {
            if didlaunchScreenFinishAnimation {
                print("\nLaunch Screen Did Finish Animation")
                didFinishEntranceAction()
            }
        }
    }
    
    var isViewToShowChosen: Bool = false {
        didSet {
            if isViewToShowChosen {
                print("\nView To Show Is Chosen")
                didFinishEntranceAction()
            }
        }
    }
    
//    MARK: - life cycle
    init(rootViewController: RootViewController) {
        self.rootViewController = rootViewController
        self.rootViewController.appCoordinator = self
    }
    
//    MARK: - public func
    func resolveEntrance() {
        print("\nResolve Entrance")
        if checkIfUserSignedIn() {
            
        } else {
            
        }
        
        isViewToShowChosen = true
    }
    
    public func someButtonTapped(tag: Int) {
        if tag == 0 {
            entrancemodule = .init()
        } else {
            entrancemodule = nil
        }
        
        print("\n\(tag)")
    }
    
//    MARK: - private func
    private func didFinishEntranceAction() {
        if didlaunchScreenFinishAnimation, isViewToShowChosen {
            print("\nHello world!")
        } else {
            print("\nSomething is not ready")
        }
    }
    
    private func checkIfUserSignedIn() -> Bool {
        if let token = Service.user.accessToken {
            return true
        } else {
            return false
        }
    }
}
