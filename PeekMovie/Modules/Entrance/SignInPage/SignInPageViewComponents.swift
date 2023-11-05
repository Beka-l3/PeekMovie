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
    
    lazy var loginButton = PeekButton(type: .main, titleText: Constants.loginButtonTitleText)
    lazy var SignUpButton = PeekButton(type: .secondary, titleText: Constants.signUpButtonTitleText)
    lazy var SignInButton = PeekButton(type: .secondary, titleText: Constants.signInButtonTitleText)
    lazy var forgotPasswordButton = PeekButton(type: .tertiary, titleText: Constants.forgotPasswordButtonTitleText)
    
    
    func setupViews(parent: UIView) {
        parent.backgroundColor = Colors.backgroundPrimary
        
        parent.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
            
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
        
        static let loginButtonTitleText = "Login"
        static let signUpButtonTitleText = "Sign Up"
        static let signInButtonTitleText = "Sign In"
        static let forgotPasswordButtonTitleText = "forgot password?"
    }
}
