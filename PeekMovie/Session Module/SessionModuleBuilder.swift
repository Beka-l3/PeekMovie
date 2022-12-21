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
        secondaryPage.presenter = self.presenter
        
        setTabBarItems()
    }
    
    private func setTabBarItems() {
        view.tabBar.backgroundColor = black
        
        mainPage.tabBarItem.title = ""
//        mainPage.tabBarItem.image = .add.withTintColor(.systemGray)
//        mainPage.tabBarItem.image = UIImage(named: "LikeDislikeWhite")!
//        mainPage.tabBarItem.selectedImage = .add.withTintColor( yellow, renderingMode: .alwaysOriginal )
//        mainPage.tabBarItem.selectedImage = UIImage(named: "LikeDislikeYellow")!
        print(UIImage.add.size)
        mainPage.tabBarItem =  UITabBarItem.init(title: "", image: UIImage(named: "LikeDislikeWhite"), selectedImage: UIImage(named: "LikeDislikeYellow"))
        
        secondaryPage.tabBarItem.title = ""
//        secondaryPage.tabBarItem.image = UIImage(named: "RatingWhite")!
//        secondaryPage.tabBarItem.selectedImage = UIImage(named: "RatingYellow")!
        secondaryPage.tabBarItem = UITabBarItem.init(title: "", image: UIImage(named: "RatingWhite"), selectedImage: UIImage(named: "RatingYellow"))
    }
    
    
}
