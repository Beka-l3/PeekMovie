//
//  SignInPageViewComponents+Constraints.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 09.11.2023.
//

import UIKit


extension SignInPageViewComponents {
    
    func setupConstraints(parent: UIView) {
        NSLayoutConstraint.activate([
            appLogoIconView.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            appLogoIconView.topAnchor.constraint(equalTo: parent.topAnchor, constant: Constants.paddingXXXXL),
            appLogoIconView.widthAnchor.constraint(equalToConstant: appLogoIconView.iconSize.rawValue),
            appLogoIconView.heightAnchor.constraint(equalToConstant: appLogoIconView.iconSize.rawValue),
            
            inputBlock.topAnchor.constraint(equalTo: appLogoIconView.bottomAnchor, constant: Constants.paddingXXXXL),
            inputBlock.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            inputBlock.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            inputBlock.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            
            emailIconView.topAnchor.constraint(equalTo: inputBlock.topAnchor, constant: Constants.paddingXXXL),
            emailIconView.leadingAnchor.constraint(equalTo: inputBlock.leadingAnchor, constant: Constants.paddingXL),
            emailIconView.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            emailTextField.topAnchor.constraint(equalTo: emailIconView.topAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: emailIconView.trailingAnchor, constant: Constants.paddingXL),
            emailTextField.trailingAnchor.constraint(equalTo: inputBlock.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            usernameIconView.topAnchor.constraint(equalTo: emailIconView.bottomAnchor, constant: Constants.paddingL),
            usernameIconView.leadingAnchor.constraint(equalTo: inputBlock.leadingAnchor, constant: Constants.paddingXL),
            usernameIconView.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),

            usernameTextField.topAnchor.constraint(equalTo: usernameIconView.topAnchor),
            usernameTextField.leadingAnchor.constraint(equalTo: usernameIconView.trailingAnchor, constant: Constants.paddingXL),
            usernameTextField.trailingAnchor.constraint(equalTo: inputBlock.trailingAnchor),
            usernameTextField.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            passwordIconView.topAnchor.constraint(equalTo: emailIconView.bottomAnchor, constant: Constants.paddingL),
            passwordIconView.leadingAnchor.constraint(equalTo: inputBlock.leadingAnchor, constant: Constants.paddingXL),
            passwordIconView.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordIconView.topAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordIconView.trailingAnchor, constant: Constants.paddingXL),
            passwordTextField.trailingAnchor.constraint(equalTo: inputBlock.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            mainButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Constants.paddingXL),
            mainButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            
//            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Constants.paddingXL),
//            signUpButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: Constants.paddingS),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: mainButton.leadingAnchor),
            
            signUpHStack.centerXAnchor.constraint(equalTo: inputBlock.centerXAnchor),
            signUpHStack.bottomAnchor.constraint(equalTo: inputBlock.bottomAnchor, constant: -Constants.paddingL),
            
            signInHStack.centerXAnchor.constraint(equalTo: inputBlock.centerXAnchor),
            signInHStack.bottomAnchor.constraint(equalTo: inputBlock.bottomAnchor, constant: -Constants.paddingL),
        ])
    }
    
    func changeConstraintsToSignUp() {
        
    }
    
    func changeConstraintsToSignIn() {
        
    }
}
