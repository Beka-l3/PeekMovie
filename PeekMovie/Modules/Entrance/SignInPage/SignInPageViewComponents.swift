//
//  SignInPageViewComponents.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 22.08.2023.
//

import UIKit

final class SignInPageViewComponents {
    
//    var usernameTextField: InputTextField = .init()
    
    lazy var usernameTextField = UserInputTextField(placeholder: Constants.usernameTextFieldPlaceholder)
    lazy var emailTextField = UserInputTextField(placeholder: Constants.emailTextFieldPlaceholder)
    lazy var passwordTextField = UserInputTextField(placeholder: Constants.passwordTextFieldPlaceholder)
    
    lazy var continueButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = Colors.focus
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = Fonts.bold16
        button.setTitleColor(Colors.backgroundSecondary, for: .normal)
        
        button.layer.cornerRadius = 24
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupViews(parent: UIView) {
        parent.backgroundColor = Colors.backgroundPrimary
        
        parent.addSubview(usernameTextField)
        parent.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerYAnchor),
            usernameTextField.widthAnchor.constraint(equalToConstant: 250),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            continueButton.centerXAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerXAnchor),
            continueButton.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 64),
            continueButton.widthAnchor.constraint(equalToConstant: 250),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupLayers() {
        
    }
}


extension SignInPageViewComponents {
    private enum Constants {
        static let usernameTextFieldPlaceholder = "Username"
        static let emailTextFieldPlaceholder = "Email"
        static let passwordTextFieldPlaceholder = "Password"
    }
}
