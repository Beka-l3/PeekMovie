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
    
    lazy var appLogoIconView = PeekIconView(image: Images.Logo.App.x90png, size: .x90)
    
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
    
    lazy var signUpLabel = PeekLabel(type: .secondary, text: Constants.signUpLabelText, font: .callout)
    lazy var signInLabel = PeekLabel(type: .secondary, text: Constants.signInLabelText, font: .callout)
    
    lazy var signUpHStack = getBottomHStackView(with: [signUpLabel, signUpButtonSecondary])
    lazy var signInHStack = getBottomHStackView(with: [signInLabel, signInButton])
    
    
    func setupViews(parent: UIView) {
        parent.backgroundColor = Colors.backgroundPrimary
        
        parent.addSubview(appLogoIconView)
        parent.addSubview(usernameTextField)
        parent.addSubview(usernameIconView)
        parent.addSubview(emailTextField)
        parent.addSubview(emailIconView)
        parent.addSubview(passwordTextField)
        parent.addSubview(passwordIconView)
        parent.addSubview(signUpButton)
        parent.addSubview(forgotPasswordButton)
        parent.addSubview(signInHStack)
        
        NSLayoutConstraint.activate([
            appLogoIconView.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            appLogoIconView.topAnchor.constraint(equalTo: parent.topAnchor, constant: Constants.appLogoIconViewYOrigin),
            appLogoIconView.widthAnchor.constraint(equalToConstant: appLogoIconView.iconSize.rawValue),
            appLogoIconView.heightAnchor.constraint(equalToConstant: appLogoIconView.iconSize.rawValue),
            
            usernameTextField.topAnchor.constraint(equalTo: appLogoIconView.bottomAnchor, constant: Constants.inputBlockPadding),
            usernameTextField.leadingAnchor.constraint(equalTo: parent.centerXAnchor, constant: -Constants.paddingXL),
            usernameTextField.trailingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.trailingAnchor),
            
            usernameIconView.centerYAnchor.constraint(equalTo: usernameTextField.centerYAnchor),
            usernameIconView.widthAnchor.constraint(equalToConstant: usernameIconView.iconSize.rawValue),
            usernameIconView.heightAnchor.constraint(equalToConstant: usernameIconView.iconSize.rawValue),
            usernameIconView.trailingAnchor.constraint(equalTo: usernameTextField.leadingAnchor, constant: -Constants.paddingL),
            
            emailTextField.topAnchor.constraint(equalTo: usernameIconView.bottomAnchor, constant: Constants.paddingL),
            emailTextField.leadingAnchor.constraint(equalTo: parent.centerXAnchor, constant: -Constants.paddingXL),
            emailTextField.trailingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.trailingAnchor),
            
            emailIconView.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor),
            emailIconView.widthAnchor.constraint(equalToConstant: emailIconView.iconSize.rawValue),
            emailIconView.heightAnchor.constraint(equalToConstant: emailIconView.iconSize.rawValue),
            emailIconView.trailingAnchor.constraint(equalTo: emailTextField.leadingAnchor, constant: -Constants.paddingL),
            
            passwordTextField.topAnchor.constraint(equalTo: emailIconView.bottomAnchor, constant: Constants.paddingL),
            passwordTextField.leadingAnchor.constraint(equalTo: parent.centerXAnchor, constant: -Constants.paddingXL),
            passwordTextField.trailingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.trailingAnchor),
            
            passwordIconView.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            passwordIconView.widthAnchor.constraint(equalToConstant: passwordIconView.iconSize.rawValue),
            passwordIconView.heightAnchor.constraint(equalToConstant: passwordIconView.iconSize.rawValue),
            passwordIconView.trailingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: -Constants.paddingL),
            
            signUpButton.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Constants.paddingXL),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Constants.paddingXS),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.paddingXS),
            
            signInHStack.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            signInHStack.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -Constants.paddingL),
        ])
    }
    
    func setupLayers(parent: UIView) {
        parent.layer.addSublayer(backgroundLinear)
    }
}

