//
//  SessionModuleBuilder.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 24.10.2022.
//

import UIKit


final class SessionModuleBuilder: Colors {
    
    let view: UITabBarController
    let presenter: SessionModulePresenter
    
    let mainPage: PosterViewPage
    let secondaryPage: CollectionViewPage
    
    
    init(networkService: NetworkService) {
        self.mainPage = PosterViewPage()
        self.secondaryPage = CollectionViewPage()
        
        self.view = UITabBarController()
        self.view.setViewControllers([mainPage, secondaryPage], animated: true)
        
        self.presenter = SessionModulePresenter(
            mainPage: mainPage,
            secondaryPage: secondaryPage,
            networkService: networkService
        )
        
        mainPage.presenter = self.presenter
        
        setTabBarItems()
    }
    
    private func setTabBarItems() {
        view.tabBar.backgroundColor = black
        
        mainPage.tabBarItem.title = "Login"
        mainPage.tabBarItem.selectedImage = .add.withTintColor( yellow, renderingMode: .alwaysOriginal )
        mainPage.tabBarItem.image = .add.withTintColor(.systemGray)
        
        secondaryPage.tabBarItem.title = "Join"
        secondaryPage.tabBarItem.selectedImage = .add.withTintColor( yellow, renderingMode: .alwaysOriginal )
        secondaryPage.tabBarItem.image = .add.withTintColor(.systemGray)
    }
    
    
}
