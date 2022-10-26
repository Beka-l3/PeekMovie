//
//  CollectionView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 24.10.2022.
//

import UIKit

class CollectionViewPage: UIViewController, Colors {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
}
