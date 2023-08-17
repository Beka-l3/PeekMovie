//
//  CollectionViewModels.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 21.11.2022.
//

import UIKit


class CollectionViewModels: Interactives, Informatives, Colors, Fonts, MovieInfoViews {
    
    lazy var quitButton: UIButton = getTeritaryButton(with: "Quit")
    lazy var ratingLabel: UILabel = getLabel(font: headerFont, text: "Room ratings")
    
    lazy var collectionView: UICollectionView = {
        let l = UICollectionViewFlowLayout()
        l.scrollDirection = .vertical
        l.minimumLineSpacing = EPConstants.smallPadding
        l.sectionInset = UIEdgeInsets(top: EPConstants.smallPadding, left: EPConstants.smallPadding, bottom: EPConstants.smallPadding, right: EPConstants.smallPadding)
        let c = UICollectionView(frame: .zero, collectionViewLayout: l)
        c.backgroundColor = clearBlack
        c.register(MovieCollectionCell.self, forCellWithReuseIdentifier: MovieCollectionCell.identifier)
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()
    
    
    func setupViews(parrent: UIView) {
        parrent.addSubview(collectionView)
        parrent.addSubview(quitButton)
        parrent.addSubview(ratingLabel)
        NSLayoutConstraint.activate([
            quitButton.topAnchor.constraint(equalTo: parrent.safeAreaLayoutGuide.topAnchor, constant: EPConstants.padding),
            quitButton.leadingAnchor.constraint(equalTo: parrent.safeAreaLayoutGuide.leadingAnchor, constant: EPConstants.padding),
            
            ratingLabel.centerYAnchor.constraint(equalTo: quitButton.centerYAnchor),
            ratingLabel.centerXAnchor.constraint(equalTo: parrent.safeAreaLayoutGuide.centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: quitButton.bottomAnchor, constant: EPConstants.padding),
            collectionView.leadingAnchor.constraint(equalTo: parrent.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: parrent.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: parrent.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func setupLayers() {
        
    }
}
