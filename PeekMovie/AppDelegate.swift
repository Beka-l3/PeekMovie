//
//  AppDelegate.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 10.10.2022.
//

import UIKit

protocol AppDelegateLogoPage {
    func getLogoPage() -> UIViewController
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let username = UserDefaults.standard.string(forKey: GConstants.usernameKey) ?? ""
        let password = UserDefaults.standard.string(forKey: GConstants.passwordKey) ?? ""
        let isLoggedIn = !password.isEmpty && !username.isEmpty
        
        let appCoordinator = AppCoordinator(isLoggedIn: isLoggedIn)
        
        let navigationController = UINavigationController(rootViewController: appCoordinator.getLogoPage())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
