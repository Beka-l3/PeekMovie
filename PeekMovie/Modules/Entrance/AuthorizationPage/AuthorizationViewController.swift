//
//  SignInPageViewController.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 22.08.2023.
//

import UIKit


protocol AuthorizationDelegate: AnyObject {
    func loggedIn()
}


final class AuthorizationViewController: UIViewController {
    
    weak var appCoordinator: AuthorizationDelegate?
    
    let viewComponents = AuthorizationViewComponents()
    var entranceState: State = .signIn
    
    let passwordRestorationPage: PasswordRestorationViewController
    
    var isInNavigationAnimationNeeded: Bool = false
    
    
//    MARK: lifecycle
    init(passwordRestorationPage: PasswordRestorationViewController) {
        self.passwordRestorationPage = passwordRestorationPage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.passwordRestorationPage = .init()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        changeState(to: .signIn)
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
    
    
//    MARK:  private func
    private func setupViews() {
        viewComponents.setupViews(parent: view)
        
        viewComponents.mainButton.addTarget(self, action: #selector(handleMainButton), for: .touchUpInside)
        viewComponents.secondaryButton.addTarget(self, action: #selector(handleSecondaryButton), for: .touchUpInside)
        viewComponents.tertiaryButton.addTarget(self, action: #selector(handleTertiaryButton), for: .touchUpInside)
        
        viewComponents.emailTextField.delegate = self
        viewComponents.usernameTextField.delegate = self
        viewComponents.passwordTextField.delegate = self
        
        viewComponents.tapHandlerViewBackground.delegate = self
        viewComponents.tapHandlerViewInputBlock.delegate = self
        
    }
    
    private func setupLayers() {
        viewComponents.setupLayers(parent: view)
    }
    
}


extension AuthorizationViewController {
    
    enum State {
        case signIn
        case signUp
    }
    
}


extension AuthorizationViewController {
    
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
        
    }
    
    private func resetAfterOutNavigationAnimation() {
        guard isInNavigationAnimationNeeded else { return }
        
        
    }
    
}
