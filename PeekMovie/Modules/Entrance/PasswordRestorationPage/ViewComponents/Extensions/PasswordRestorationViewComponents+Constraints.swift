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
            draggerView.topAnchor.constraint(equalTo: parent.topAnchor, constant: Constants.padding / 2),
            draggerView.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            
            captionLabel.topAnchor.constraint(equalTo: draggerView.bottomAnchor, constant: Constants.paddingXL),
            captionLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: Constants.paddingXXL),
            captionLabel.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -Constants.paddingXXL),
            
            emailIconView.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: Constants.paddingL),
            emailIconView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: Constants.paddingXL),
            emailIconView.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            passwordIconView.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: Constants.paddingL),
            passwordIconView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: Constants.paddingXL),
            passwordIconView.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            emailTextField.topAnchor.constraint(equalTo: emailIconView.topAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: emailIconView.trailingAnchor, constant: Constants.paddingXL),
            emailTextField.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            passwordTextField.topAnchor.constraint(equalTo: emailIconView.topAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: emailIconView.trailingAnchor, constant: Constants.paddingXL),
            passwordTextField.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            verificationCodeView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Constants.paddingXL),
            verificationCodeView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: Constants.paddingL),
            verificationCodeView.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -Constants.paddingL),
            verificationCodeView.heightAnchor.constraint(equalToConstant: Constants.verificationCodeViewHeight),
            
            mainButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            mainButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Constants.paddingXL),
            
        ])
        
        captionLabelHeightConstraint = captionLabel.heightAnchor.constraint(equalToConstant: Constants.paddingL)
        captionLabelHeightConstraint?.isActive = true
        
    }
    
}
