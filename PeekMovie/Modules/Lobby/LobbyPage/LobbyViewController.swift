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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayers()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        resetAfterOutNavigationAnimation()
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
            viewComponents.usernameLabel.alpha = 0
            viewComponents.usernameIconView.alpha = 0
            viewComponents.roomIdTextField.alpha = 0
            viewComponents.roomIdIconView.alpha = 0
            
            viewComponents.mainButton.alpha = 0
            viewComponents.secondaryButton.alpha = 0
            viewComponents.tertiaryButton.alpha = 0
            
            viewComponents.createRoomHStack.alpha = 0
            
        case .lobby:
            break
            
        case .session:
            break
            
        }
        
        isInNavigationAnimationNeeded = true
    }
    
    func startOutNavigationAnimation(destination: AppCoordinator.ModuleType) async {
        
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
        guard isInNavigationAnimationNeeded else { return }
        
        UIView.animate(withDuration: Constants.Animation.durationDefault / 2) { [unowned self] in
            self.viewComponents.usernameLabel.alpha = 1
            self.viewComponents.usernameIconView.alpha = 1
            self.viewComponents.roomIdTextField.alpha = 1
            self.viewComponents.roomIdIconView.alpha = 1
            
            self.viewComponents.mainButton.alpha = 1
            self.viewComponents.secondaryButton.alpha = 1
            self.viewComponents.tertiaryButton.alpha = 1
            
            self.viewComponents.createRoomHStack.alpha = 1
        }
        
        isInNavigationAnimationNeeded = false
    }
    
    private func resetAfterOutNavigationAnimation() {
        
    }
    
}
