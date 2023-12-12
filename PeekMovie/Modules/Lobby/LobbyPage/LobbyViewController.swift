//
//  LobbyViewController.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 12.12.2023.
//

import UIKit


final class LobbyViewController: UIViewController {
    
    private let viewComponents: LobbyViewComponents = .init()
    
    
//    MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayers()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    
//    MARK: private func
    private func setupViews() {
        viewComponents.setupView(parent: view)
        
        viewComponents.tertiaryButton.addTarget(self, action: #selector(handleTertiaryButton), for: .touchUpInside)
    }
    
    private func setupLayers() {
        viewComponents.setupLayers(parent: view)
    }
    
}
