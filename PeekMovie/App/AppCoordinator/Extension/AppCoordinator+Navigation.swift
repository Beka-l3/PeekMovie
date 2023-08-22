//
//  AppCoordinator+Navigation.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 21.08.2023.
//

import UIKit

extension AppCoordinator {
    @MainActor func pushViewController(_ vc: UIViewController) {
        rootViewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    @MainActor func popViewController() {
        rootViewController.navigationController?.popViewController(animated: true)
    }
    
    @MainActor func setModuleWith(viewController: UIViewController) {
        rootViewController.navigationController?.setViewControllers([viewController], animated: true)
//        rootViewController.navigationController?.popToRootViewController(animated: true)
//        pushViewController(viewController)
    }
}
