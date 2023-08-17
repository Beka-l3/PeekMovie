//
//  AppDelegate.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.08.2023.
//

import Foundation
import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootViewController: RootViewController = .init()
        let appCoordinator: AppCoordinator = .init(rootViewController: rootViewController)
        
        let navigationController: UINavigationController = .init(rootViewController: rootViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        Task {
            appCoordinator.resolveEntrance()
        }
        
        return true
    }
}
