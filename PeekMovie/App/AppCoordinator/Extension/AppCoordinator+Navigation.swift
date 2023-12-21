//
//  AppCoordinator+Navigation.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 21.08.2023.
//

import UIKit

extension AppCoordinator {
    @MainActor func pushViewController(_ vc: UIViewController) {
        navigationController.pushViewController(vc, animated: true)
    }
    
    @MainActor func popViewController() {
        navigationController.popViewController(animated: true)
    }
    
    @MainActor func setModuleWith(viewController: UIViewController) {
        navigationController.setViewControllers([viewController], animated: false)
    }
}
