//
//  LobbyViewController.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 12.12.2023.
//

import UIKit


final class LobbyViewController: UIViewController {
    
    var isInNavigationAnimationNeeded: Bool = false
    
    private let viewComponents: LobbyViewComponents = .init()
    private var user: PeekUser?
    
    
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
        startInNavigationAnimation()
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
    
    
//    MARK: exposed func
    func prepareLobby() throws {
        guard let user = Service.user.user else {
            throw UserService.ServiceError.missingUser
        }
        
        self.user = user
        viewComponents.usernameLabel.text = user.username
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


extension LobbyViewController {
    
    func prepareForInNavigationAnimation(from: AppCoordinator.ModuleType) {
        
        switch from {
        
        case .none:
            break
            
        case .entrance:
            break
            
        case .lobby:
            break
            
        case .session:
            break
            
        }
        
    }
    
    func startOutNavigationAnimation(destination: AppCoordinator.ModuleType) {
        
        switch destination {
        
        case .none:
            break
            
        case .entrance:
            break
            
        case .lobby:
            break
            
        case .session:
            break
            
        }
        
    }
    
    private func startInNavigationAnimation() {
        
    }
    
    private func resetAfterOutNavigationAnimation() {
        guard isInNavigationAnimationNeeded else { return }
        
        
    }
    
}
