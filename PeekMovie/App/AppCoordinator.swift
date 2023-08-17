//
//  AppCoordinator.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.08.2023.
//

import Foundation

final class AppCoordinator {
    
    let rootViewController: RootViewController
    
    var launchScreenDidFinishAnimation: Bool = false {
        didSet {
            if launchScreenDidFinishAnimation {
                print("\nLaunch Screen Did Finish Animation")
                didFinishEntranceAction()
            }
        }
    }
    
    init(rootViewController: RootViewController) {
        self.rootViewController = rootViewController
        self.rootViewController.appCoordinator = self
    }
    
    func resolveEntrance() {
        print("\nResolve Entrance")
    }
    
    func didFinishEntranceAction() {
        if launchScreenDidFinishAnimation {
            print("\nHello world!")
        }
    }
    
}
