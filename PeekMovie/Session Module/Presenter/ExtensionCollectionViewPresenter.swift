//
//  ExtensionCollectionViewPresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 23.11.2022.
//

import UIKit

extension SessionModulePresenter: CollectionViewDelegate {
    func getDataAmount() -> Int {
        likedMovies.count
    }
    
    func getItem(at: Int) -> MovieDTO {
        likedMovies[at]
    }
    
    
}
