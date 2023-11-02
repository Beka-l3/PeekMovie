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
    
    let rootViewController: RootViewController
    var entranceModule: EntranceModuleBuilder
    var lobbyModule: LobbyModuleBuilder
    var sessionModule: SessionModuleBuilder
    
    var moduleToShow: ModuleType = .none {
        didSet {
            if oldValue == .none {
                print("\nModule To Show Is Chosen")
                didFinishEntranceAction()
            } else {
                print("\nSwap Modules")
                swapModules(moduleToHide: oldValue)
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
    
    
    //    MARK:  life cycle
    init(rootViewController: RootViewController) {
        self.rootViewController = rootViewController
        self.entranceModule = .init()
        self.sessionModule = .init()
        self.lobbyModule = .init()
        
        self.rootViewController.appCoordinator = self
    }
    
    
    //    MARK:  public func
    func resolveEntrance() {
        print("\nResolve Entrance")
        if checkIfUserSignedIn() {
            signInPeekID()
        } else {
            moduleToShow = .entrance
        }
    }
}



extension AppCoordinator {
    private func didFinishEntranceAction() {
        if didlaunchScreenFinishAnimation, moduleToShow != .none {
            print("\nHello world!")
            switch moduleToShow {
            case .entrance:
                print("\nShow entrance")
                Task {
                    await setModuleWith(viewController: entranceModule.signInPage)
                }
            case .lobby:
                print("\nShow lobby")
            default:
                print("\nNo module is chosen")
            }
            
        } else {
            print("\nSomething is not ready")
        }
    }
    
    private func checkIfUserSignedIn() -> Bool {
        if let _ = Service.user.accessToken {
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
