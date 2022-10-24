//
//  AppDelegate.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 10.10.2022.
//

import UIKit

protocol AppDelegateEntrancePage {
    func getEntrancePage() -> UIViewController
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let appCoordinator = AppCoordinator()
        appCoordinator.appDelegate = self
        let appDelegateEntrancePage: AppDelegateEntrancePage = appCoordinator
        
//        let navigationController = UINavigationController(rootViewController: appDelegateEntrancePage.getEntrancePage())
        window?.rootViewController = appDelegateEntrancePage.getEntrancePage()
        window?.makeKeyAndVisible()
        
        return true
    }
}

extension AppDelegate: AppCoordinatorDelegate {
    func setModule(view: UIViewController) {
        print("set Module App Delegate")
        window?.rootViewController = view
        window?.makeKeyAndVisible()
        
    }
}

