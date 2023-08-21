//
//  AppCoordinator+Navigation.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 21.08.2023.
//

import UIKit

extension AppCoordinator {
    @MainActor internal func pushViewController(_ vc: UIViewController) {
        rootViewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    @MainActor internal func popViewController() {
        rootViewController.navigationController?.popViewController(animated: true)
    }
    
    @MainActor internal func setModuleWith(viewController: UIViewController) {
        rootViewController.navigationController?.popToRootViewController(animated: true)
        pushViewController(viewController)
    }
}
