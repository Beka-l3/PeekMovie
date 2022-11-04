//
//  AppDelegate.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 10.10.2022.
//

import UIKit

protocol AppDelegateLogoPage {
    func pushEntrancePage()
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let logoPage = LogoPage()
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: logoPage)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let networkClient = NetworkClientImplementation(urlSession: .init(configuration: .default))
        let networkService = NetworkServiceImplementation(networkClient: networkClient)
        
        let username = UserDefaults.standard.string(forKey: GConstants.usernameKey) ?? ""
        let password = UserDefaults.standard.string(forKey: GConstants.passwordKey) ?? ""
        var isLoggedIn = !password.isEmpty && !username.isEmpty
        
//        if isLoggedIn {
//            networkService.login(
//                credentials: PeekID(
//                    username: username,
//                    password: password
//                )
//            ) { result in
//                switch result {
//                case .success(let token):
//                    isLoggedIn = true
//                    UserDefaults.standard.set(token.token, forKey: GConstants.tokenKey)
//                case .failure(let error):
//                    isLoggedIn = false
//                    print(error)
//                }
//            }
//        }
        
        let appCoordinator = AppCoordinator(
            isLoggedIn: isLoggedIn,
            logoPage: logoPage,
            networkClient: networkClient,
            networkService: networkService
        )
        DispatchQueue.global().async {
            sleep(3)
            DispatchQueue.main.async {
                appCoordinator.pushEntrancePage()
            }
        }
//        appCoordinator.pushEntrancePage()
        
        return true
    }
}
