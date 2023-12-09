//
//  PasswordRestorationViewComponents+Constraints.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.11.2023.
//

import UIKit


extension PasswordRestorationViewComponents {
    
    func setupConstraints(parent: UIView) {
        
        NSLayoutConstraint.activate([
            tapHandlerView.topAnchor.constraint(equalTo: parent.topAnchor),
            tapHandlerView.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            tapHandlerView.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            tapHandlerView.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            
            draggerView.topAnchor.constraint(equalTo: parent.topAnchor, constant: Constants.padding / 2),
            draggerView.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            
            captionLabel.topAnchor.constraint(equalTo: draggerView.bottomAnchor, constant: Constants.paddingXL),
            captionLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: Constants.paddingXXL),
            captionLabel.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -Constants.paddingXXL),
            
            emailLabel.topAnchor.constraint(equalTo: captionLabel.topAnchor, constant: Constants.paddingL / 2),
            emailLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: Constants.paddingL),
            emailLabel.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -Constants.paddingL),
            
            emailIconView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Constants.paddingL),
            emailIconView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: Constants.paddingXL),
            emailIconView.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            emailIconView.widthAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            emailTextField.topAnchor.constraint(equalTo: emailIconView.topAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: emailIconView.trailingAnchor, constant: Constants.paddingXL),
            emailTextField.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            passwordIconView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Constants.paddingL),
            passwordIconView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: Constants.paddingXL),
            passwordIconView.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            passwordIconView.widthAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordIconView.topAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordIconView.trailingAnchor, constant: Constants.paddingXL),
            passwordTextField.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            pinCodeBlockView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Constants.paddingXL),
            pinCodeBlockView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: Constants.paddingL),
            pinCodeBlockView.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -Constants.paddingL),
            pinCodeBlockView.heightAnchor.constraint(equalToConstant: Constants.verificationCodeViewHeight),
            
            mainButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            mainButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Constants.paddingXL),
            
            timerHStack.topAnchor.constraint(equalTo: pinCodeBlockView.bottomAnchor, constant: Constants.paddingXL),
            timerHStack.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
        ])
        
    }
    
}
