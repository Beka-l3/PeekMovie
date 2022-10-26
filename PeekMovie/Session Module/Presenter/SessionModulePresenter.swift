//
//  SessionModulePresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 24.10.2022.
//

import UIKit

protocol SessionModuleDelegate {
    
}

final class SessionModulePresenter {
    
    var appCoordinator: SessionModuleDelegate?
    
    private var mainPage: PosterViewPage
    private var secondaryPage: CollectionViewPage
    
    init(
        mainPage: PosterViewPage,
        secondaryPage: CollectionViewPage
    ) {
        self.mainPage = mainPage
        self.secondaryPage = secondaryPage
    }
    
    
    
}

// MARK: -- ⬇️ EXTENSIONS ⬇️
