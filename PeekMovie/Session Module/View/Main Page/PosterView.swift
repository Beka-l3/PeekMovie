//
//  PosterView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 24.10.2022.
//

import UIKit

class PosterViewPage: UIViewController, Colors {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
}
