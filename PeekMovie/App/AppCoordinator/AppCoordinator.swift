//
//  AppCoordinator.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.08.2023.
//

import UIKit


final class AppCoordinator {
    
    let navigationController: UINavigationController
    let splashScreenViewController: SplashScreenViewController
    
    var entranceModule: EntranceModuleBuilder
    var lobbyModule: LobbyModuleBuilder
    var sessionModule: SessionModuleBuilder
    
    var moduleToShow: ModuleType = .none {
        didSet {
            if oldValue == .none {
                didFinishEntranceAction()
            } else {
                swapModules(moduleToHide: oldValue)
            }
        }
    }
    
    var didlaunchScreenFinishAnimation: Bool = false {
        didSet {
            if didlaunchScreenFinishAnimation {
                didFinishEntranceAction()
            }
        }
    }
    
    
//    MARK:  lifecycle
    init(navigationController: UINavigationController, splashScreenViewController: SplashScreenViewController) {
        self.navigationController = navigationController
        self.splashScreenViewController = splashScreenViewController
        self.entranceModule = .init()
        self.sessionModule = .init()
        self.lobbyModule = .init()
        
        self.splashScreenViewController.appCoordinator = self
        self.entranceModule.authorizationPage.appCoordinator = self
    }
    
    
//    MARK:  public func
    func resolveEntrance() async {
        if await checkIfUserSignedIn() {
            await signInPeekID()
        } else {
            moduleToShow = .entrance
        }
    }
}


extension AppCoordinator {
    enum ModuleType {
        case entrance, lobby, session, none
    }
}


extension AppCoordinator {
    private func didFinishEntranceAction() {
        if didlaunchScreenFinishAnimation, moduleToShow != .none {
            
            switch moduleToShow {
            case .entrance:
                Task {
                    await setModuleWith(viewController: entranceModule.authorizationPage)
                }
            case .lobby:
                print("\nShow lobby")
            default:
                print("\nNo module is chosen")
            }
            
        }
    }
    
    private func checkIfUserSignedIn() async -> Bool {
        do {
            try await Task.sleep(nanoseconds: .random(in: 1...3) * 1_000_000_000)
        } catch {
            print("Failed to sleep")
        }
        
        if let _ = Service.user.accessToken {
            return true
        } else {
            return false
        }
    }
    
    private func signInPeekID() async {
        do {
            try await Task.sleep(nanoseconds: .random(in: 1...3) * 1_000_000_000)
        } catch {
            print("Failed to sleep")
        }
        
        moduleToShow = .lobby
    }
    
}


extension AppCoordinator {
    
    private func swapModules(moduleToHide: ModuleType) {
        switch (moduleToShow, moduleToHide) {
            
        case (.entrance, _):
            break
            
        case (.lobby, .entrance):
            Task {
                await setModuleWith(viewController: lobbyModule.lobbyPage)
            }
            
        case (.session, _):
            break
            
        default:
            break
            
        }
    }
    
}
