//
//  PassowrdRestorationViewController.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.11.2023.
//

import UIKit


final class PasswordRestorationViewController: UIViewController {
    
    private let viewComponents: PasswordRestorationViewComponents = .init()
    
    private(set) var passwordRestorationState: State = .sendCode
    
    
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
    }
    
    private func setupLayers() {
        viewComponents.setupLayers(parent: view)
    }

    
}


extension PasswordRestorationViewController {
    
    enum State {
        case sendCode
        case verifyCode
        case resetPassword
    }
    
}
