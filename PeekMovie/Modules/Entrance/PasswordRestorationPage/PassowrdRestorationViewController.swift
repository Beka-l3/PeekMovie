//
//  PassowrdRestorationViewController.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.11.2023.
//

import UIKit


final class PasswordRestorationViewController: UIViewController {
    
    let viewComponents: PasswordRestorationViewComponents = .init()
    var passwordRestorationState: State = .enterEmail
    
    
//    MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        viewComponents.reset()
        changeState(to: .enterEmail)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayers()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    
//    MARK:  private func
    private func setupViews() {
        viewComponents.setupViews(parent: view)
        
        viewComponents.mainButton.addTarget(self, action: #selector(handleMainButton), for: .touchUpInside)
        viewComponents.secondaryButton.addTarget(self, action: #selector(handleSecondaryButton), for: .touchUpInside)
        
        viewComponents.tapHandlerView.delegate = self
        viewComponents.pinCodeBlockView.delegate = self
        
        viewComponents.emailTextField.delegate = self
        viewComponents.passwordTextField.delegate = self
        viewComponents.timerLabel.delegate = self
    }
    
    private func setupLayers() {
        viewComponents.setupLayers(parent: view)
    }

}


extension PasswordRestorationViewController {
    
    enum State {
        case enterEmail
        case sendVerificationCode
        case resetPassword
    }
    
}
