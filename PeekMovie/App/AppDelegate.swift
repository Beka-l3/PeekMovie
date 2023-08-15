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
        let LaunchPage = LaunchPage()
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: LaunchPage)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let networkClient = NetworkClientImplementation(urlSession: .init(configuration: .default))
        let networkService = MockNetworkService()
//        let networkService = NetworkServiceImplementation(networkClient: networkClient)
        
        let username = UserDefaults.standard.string(forKey: GConstants.usernameKey) ?? ""
        let password = UserDefaults.standard.string(forKey: GConstants.passwordKey) ?? ""
        var isLoggedIn = !password.isEmpty && !username.isEmpty
        
        if isLoggedIn {
            networkService.login(
                credentials: PeekID(
                    username: username,
                    password: password
                )
            ) { result in
                switch result {
                case .success(let response):
                    if let data = response.data {
                        isLoggedIn = true
                        UserDefaults.standard.set(data.token, forKey: GConstants.tokenKey)
                    } else if let error = response.error {
                        print(error)
                    } else {
                        print("Server response error")
                    }
                case .failure(let error):
                    isLoggedIn = false
                    print(error)
                }
            }
        }
        
        let appCoordinator = AppCoordinator(
            isLoggedIn: isLoggedIn,
            launchPage: LaunchPage,
            networkClient: networkClient,
            networkService: networkService
        )
//        DispatchQueue.global().async {
//            sleep(3)
//            DispatchQueue.main.async {
//                appCoordinator.pushEntrancePage()
//            }
//        }
        appCoordinator.pushEntrancePage()
        
        return true
    }
}
