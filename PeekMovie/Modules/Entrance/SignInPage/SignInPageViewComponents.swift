//
//  SignInPageViewComponents.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 22.08.2023.
//

import UIKit


final class SignInPageViewComponents {
    
    lazy var backgroundLinear = BackgroundGradient(type: .linearBottomLeft)
    lazy var backgroundRadial = BackgroundGradient(type: .raidalBottom)
    
    lazy var appLogoIconView = PeekIconView(image: Images.Logo.App.x90, size: .x90, cornerRadius: Constants.paddingM / 2)
    
    lazy var usernameTextField = UserInputTextField(placeholder: Constants.usernameTextFieldPlaceholder)
    lazy var emailTextField = UserInputTextField(placeholder: Constants.emailTextFieldPlaceholder)
    lazy var passwordTextField = UserInputTextField(placeholder: Constants.passwordTextFieldPlaceholder)
    
    lazy var usernameIconView = PeekIconView(image: Images.Icon.Profile.x24)
    lazy var emailIconView = PeekIconView(image: Images.Icon.Email.x24)
    lazy var passwordIconView = PeekIconView(image: Images.Icon.Key.x24)
    
    lazy var loginButton = PeekButton(type: .main, titleText: Constants.loginButtonTitleText)
    lazy var signUpButton = PeekButton(type: .main, titleText: Constants.signUpButtonTitleText)
    lazy var signUpButtonSecondary = PeekButton(type: .secondary, titleText: Constants.signUpButtonTitleText)
    lazy var signInButton = PeekButton(type: .secondary, titleText: Constants.signInButtonTitleText)
    lazy var forgotPasswordButton = PeekButton(type: .tertiary, titleText: Constants.forgotPasswordButtonTitleText)
    
    lazy var signUpLabel = PeekLabel(type: .secondary, text: Constants.signUpLabelText, font: .caption1)
    lazy var signInLabel = PeekLabel(type: .secondary, text: Constants.signInLabelText, font: .caption1)
    
    lazy var signUpHStack = getBottomHStackView(with: [signUpLabel, signUpButtonSecondary])
    lazy var signInHStack = getBottomHStackView(with: [signInLabel, signInButton])
    
    lazy var inputBlock: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.paddingM
        view.backgroundColor = Colors.backgroundPrimary
        
        view.addSubview(usernameIconView)
        view.addSubview(usernameTextField)
        view.addSubview(emailIconView)
        view.addSubview(emailTextField)
        view.addSubview(passwordIconView)
        view.addSubview(passwordTextField)
        
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(signUpHStack)
        view.addSubview(signInHStack)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    func setupViews(parent: UIView) {
        parent.backgroundColor = Colors.focus
        
        parent.addSubview(appLogoIconView)
        parent.addSubview(inputBlock)
        
        emailIconView.layer.opacity = .zero
        emailTextField.layer.opacity = .zero
        signUpButton.layer.opacity = .zero
        signInHStack.layer.opacity = .zero
        
        NSLayoutConstraint.activate([
            appLogoIconView.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            appLogoIconView.topAnchor.constraint(equalTo: parent.topAnchor, constant: Constants.paddingXXXXL),
            appLogoIconView.widthAnchor.constraint(equalToConstant: appLogoIconView.iconSize.rawValue),
            appLogoIconView.heightAnchor.constraint(equalToConstant: appLogoIconView.iconSize.rawValue),
            
            inputBlock.topAnchor.constraint(equalTo: appLogoIconView.bottomAnchor, constant: Constants.paddingXXXXL),
            inputBlock.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            inputBlock.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            inputBlock.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            
            usernameIconView.topAnchor.constraint(equalTo: inputBlock.topAnchor, constant: Constants.paddingXXXL),
            usernameIconView.leadingAnchor.constraint(equalTo: inputBlock.leadingAnchor, constant: Constants.paddingXL),
            usernameIconView.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            usernameTextField.topAnchor.constraint(equalTo: usernameIconView.topAnchor),
            usernameTextField.leadingAnchor.constraint(equalTo: usernameIconView.trailingAnchor, constant: Constants.paddingXL),
            usernameTextField.trailingAnchor.constraint(equalTo: inputBlock.trailingAnchor),
            usernameTextField.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            emailIconView.topAnchor.constraint(equalTo: usernameIconView.bottomAnchor, constant: Constants.paddingL),
            emailIconView.leadingAnchor.constraint(equalTo: inputBlock.leadingAnchor, constant: Constants.paddingXL),
            emailIconView.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),

            emailTextField.topAnchor.constraint(equalTo: emailIconView.topAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: emailIconView.trailingAnchor, constant: Constants.paddingXL),
            emailTextField.trailingAnchor.constraint(equalTo: inputBlock.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            passwordIconView.topAnchor.constraint(equalTo: usernameIconView.bottomAnchor, constant: Constants.paddingL),
            passwordIconView.leadingAnchor.constraint(equalTo: inputBlock.leadingAnchor, constant: Constants.paddingXL),
            passwordIconView.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordIconView.topAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordIconView.trailingAnchor, constant: Constants.paddingXL),
            passwordTextField.trailingAnchor.constraint(equalTo: inputBlock.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Constants.paddingXL),
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Constants.paddingXL),
            signUpButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: Constants.paddingS),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            
            signUpHStack.centerXAnchor.constraint(equalTo: inputBlock.centerXAnchor),
            signUpHStack.bottomAnchor.constraint(equalTo: inputBlock.bottomAnchor, constant: -Constants.paddingL),
            
            signInHStack.centerXAnchor.constraint(equalTo: inputBlock.centerXAnchor),
            signInHStack.bottomAnchor.constraint(equalTo: inputBlock.bottomAnchor, constant: -Constants.paddingL),
        ])
    }
    
    func setupLayers(parent: UIView) {
        backgroundLinear.frame.size = .init(width: Constants.screenWidth, height: Constants.inputBlockHeight)
        backgroundLinear.cornerRadius = Constants.paddingM
        backgroundLinear.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        inputBlock.layer.addSublayer(backgroundLinear)
    }
}

