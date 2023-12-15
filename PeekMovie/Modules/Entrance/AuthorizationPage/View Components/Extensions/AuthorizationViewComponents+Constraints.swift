//
//  SignInPageViewComponents+Constraints.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 09.11.2023.
//

import UIKit


extension AuthorizationViewComponents {
    
    func setupConstraints(parent: UIView) {
        NSLayoutConstraint.activate([
            appLogoIconView.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            appLogoIconView.topAnchor.constraint(equalTo: parent.topAnchor, constant: Constants.paddingXXXXL),
            appLogoIconView.widthAnchor.constraint(equalToConstant: appLogoIconView.iconSize.rawValue),
            appLogoIconView.heightAnchor.constraint(equalToConstant: appLogoIconView.iconSize.rawValue),
            
            backgroundImage.topAnchor.constraint(equalTo: parent.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: parent.centerYAnchor),
            
            backgroundImageBW.topAnchor.constraint(equalTo: parent.topAnchor),
            backgroundImageBW.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            backgroundImageBW.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            backgroundImageBW.bottomAnchor.constraint(equalTo: parent.centerYAnchor),
            
            backgroundImageCover.topAnchor.constraint(equalTo: backgroundImage.topAnchor),
            backgroundImageCover.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor),
            backgroundImageCover.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor),
            backgroundImageCover.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor),
            
            tapHandlerViewBackground.topAnchor.constraint(equalTo: parent.topAnchor),
            tapHandlerViewBackground.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            tapHandlerViewBackground.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            tapHandlerViewBackground.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            
            inputBlock.topAnchor.constraint(equalTo: appLogoIconView.bottomAnchor, constant: Constants.paddingXXXXL),
            inputBlock.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            inputBlock.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            inputBlock.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            
            tapHandlerViewInputBlock.topAnchor.constraint(equalTo: inputBlock.topAnchor),
            tapHandlerViewInputBlock.leadingAnchor.constraint(equalTo: inputBlock.leadingAnchor),
            tapHandlerViewInputBlock.trailingAnchor.constraint(equalTo: inputBlock.trailingAnchor),
            tapHandlerViewInputBlock.bottomAnchor.constraint(equalTo: inputBlock.bottomAnchor),
            
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
            
            passwordIconView.leadingAnchor.constraint(equalTo: inputBlock.leadingAnchor, constant: Constants.paddingXL),
            passwordIconView.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordIconView.topAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordIconView.trailingAnchor, constant: Constants.paddingXL),
            passwordTextField.trailingAnchor.constraint(equalTo: inputBlock.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            mainButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Constants.paddingXL),
            mainButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            mainButton.widthAnchor.constraint(equalToConstant:  Constants.mainButtonMaxWidth),
            mainButton.heightAnchor.constraint(equalToConstant:  Constants.mainButtonMaxHeight),
            
            tertiaryButton.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: Constants.paddingS),
            tertiaryButton.leadingAnchor.constraint(equalTo: mainButton.leadingAnchor),
            
            alternatingHStack.centerXAnchor.constraint(equalTo: inputBlock.centerXAnchor),
        ])
        
        passwordIconViewTopConstraint = passwordIconView.topAnchor.constraint(equalTo: emailIconView.bottomAnchor, constant: Constants.paddingL)
        passwordIconViewTopConstraint?.isActive = true
        
        alternatingHStackBottomConstraint = alternatingHStack.bottomAnchor.constraint(equalTo: inputBlock.bottomAnchor, constant: -Constants.paddingL)
        alternatingHStackBottomConstraint?.isActive = true
    }
    
    func changeConstraintsToSignUp(parent: UIView?) {
        if let parent = parent {
            
            self.passwordIconViewTopConstraint?.constant = 2 * Constants.paddingL + Constants.inputFieldHeight
            self.alternatingHStackBottomConstraint?.constant = Constants.paddingL
            UIView.animate(withDuration: Constants.ChangeState.animationDurationPart1) {
                parent.layoutIfNeeded()
                
            } completion: { isDone in
                
                self.alternatingHStackBottomConstraint?.constant = -Constants.paddingL
                UIView.animate(withDuration: Constants.ChangeState.animationDurationPart2, delay: Constants.ChangeState.animationDurationPart3) {
                    parent.layoutIfNeeded()
                }
            }
            
        } else {
            self.passwordIconViewTopConstraint?.constant = 2 * Constants.paddingL + Constants.inputFieldHeight
        }
    }
    
    func changeConstraintsToSignIn(parent: UIView?) {
        if let parent = parent {
            
            self.alternatingHStackBottomConstraint?.constant = Constants.paddingL
            UIView.animate(withDuration: Constants.ChangeState.animationDurationPart1) {
                parent.layoutIfNeeded()
                
            } completion: { isDone in
                
                self.passwordIconViewTopConstraint?.constant = Constants.paddingL
                UIView.animate(withDuration: Constants.ChangeState.animationDurationPart2) {
                    parent.layoutIfNeeded()
                    
                } completion: { _ in
                    
                    self.alternatingHStackBottomConstraint?.constant = -Constants.paddingL
                    UIView.animate(withDuration: Constants.ChangeState.animationDurationPart3) {
                        parent.layoutIfNeeded()
                    }
                }
            }
            
        } else {
            self.passwordIconViewTopConstraint?.constant = Constants.paddingL
        }
    }
}
