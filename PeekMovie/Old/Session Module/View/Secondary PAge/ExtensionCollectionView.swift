//
//  ExtensionCollectionView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 22.11.2022.
//

import UIKit

extension CollectionViewPage: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (view.frame.width / 2) - (2 * EPConstants.smallPadding)
        let h = (view.frame.width / 1.75)
        return CGSize(width: w, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
        guard let presenter = presenter else { return 0 }
        return presenter.getDataAmount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewModels.collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionCell.identifier, for: indexPath) as! MovieCollectionCell
        if let presenter = presenter {
            cell.setData(movie: presenter.getItem(at: indexPath.row))
        }
        
        return cell
    }
    
    
    
}
