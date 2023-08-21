//
//  AppCoordinator.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.08.2023.
//

import Foundation

final class AppCoordinator {
    enum ModuleType {
        case entrance, lobby, session, none
    }
    
    internal let rootViewController: RootViewController
    internal var entranceModule: EntranceModuleBuilder?
    internal var lobbyModule: LobbyModuleBuilder?
    internal var sessionModule: SessionModuleBuilder?
    
    internal var moduleToShow: ModuleType = .none {
        didSet {
            if moduleToShow != .none {
                print("\nView To Show Is Chosen")
                isEntranceResolved ? swapModules(moduleToHide: oldValue) : didFinishEntranceAction()
            }
        }
    }
    
    public var didlaunchScreenFinishAnimation: Bool = false {
        didSet {
            if didlaunchScreenFinishAnimation {
                print("\nLaunch Screen Did Finish Animation")
                didFinishEntranceAction()
            }
        }
    }
    
    internal var isEntranceResolved: Bool = false
    
//    MARK: - life cycle
    init(rootViewController: RootViewController) {
        self.rootViewController = rootViewController
        self.rootViewController.appCoordinator = self
    }
    
//    MARK: - public func
    func resolveEntrance() {
        print("\nResolve Entrance")
        if checkIfUserSignedIn() {
            signInPeekID()
        } else {
            moduleToShow = .entrance
        }
    }
    
//    MARK: - private func
    private func didFinishEntranceAction() {
        if didlaunchScreenFinishAnimation, moduleToShow != .none {
            print("\nHello world!")
            switch moduleToShow {
            case .entrance:
                print("\nShow entrance")
                entranceModule = .init()
            case .lobby:
                print("\nShow lobby")
                lobbyModule = .init()
            default:
                print("\nNo module is chosen")
            }
            
            isEntranceResolved = true
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
    
    private func signInPeekID() {
        moduleToShow = .lobby
    }
    
    private func swapModules(moduleToHide: ModuleType) {
        
    }
}
