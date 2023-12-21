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
        
        let navigationController: UINavigationController = .init()
        let splashScreenViewController: SplashScreenViewController = .init()
        
        navigationController.setViewControllers([splashScreenViewController], animated: false)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let appCoordinator: AppCoordinator = .init(navigationController: navigationController, splashScreenViewController: splashScreenViewController)
        
        Task {
            await appCoordinator.resolveEntrance()
        }
        
        return true
    }
}
