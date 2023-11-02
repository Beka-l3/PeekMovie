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
    func resolveEntrance() async {
        print("\nResolve Entrance")
        if await checkIfUserSignedIn() {
            await signInPeekID()
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
    
    private func swapModules(moduleToHide: ModuleType) {
        
    }
}
