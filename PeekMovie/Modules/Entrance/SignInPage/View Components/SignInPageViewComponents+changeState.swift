//
//  SignInPageViewComponents+changeState.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 09.11.2023.
//

import UIKit


extension SignInPageViewComponents {
    func changeState(to state: SignInPageViewController.State, parent: UIView? = nil, isSetup: Bool = false) {
        switch state {
            
        case .signIn:
            UIView.animate(withDuration: 0.6) {
                self.backgroundImage.layer.opacity = 1
                self.backgroundImageBW.layer.opacity = 0
            }
            
            UIView.animate(withDuration: 0.2) {
                self.mainButton.layer.opacity = 0
                
            } completion: { isDone in
                
                self.mainButton.setTitle(Constants.loginButtonTitleText, for: .normal)
                self.secondaryButton.setTitle(Constants.signUpButtonTitleText, for: .normal)
                self.alternatorLabelLabel.text = Constants.signUpLabelText
                
                UIView.animate(withDuration: 0.2) {
                    self.tertiaryButton.layer.opacity = 1
                    self.usernameIconView.layer.opacity = .zero
                    self.usernameTextField.layer.opacity = .zero
                    self.mainButton.layer.opacity = 1
                }
            }
            
            if !isSetup {
                changeConstraintsToSignIn(parent: parent)
            }
            
        case .signUp:
            UIView.animate(withDuration: 0.6) {
                self.backgroundImage.layer.opacity = 0
                self.backgroundImageBW.layer.opacity = 1
            }
            
            UIView.animate(withDuration: 0.2) {
                self.mainButton.layer.opacity = 0
                self.tertiaryButton.layer.opacity = 0
                
            } completion: { isDone in
                self.mainButton.setTitle(Constants.signUpButtonTitleText, for: .normal)
                self.secondaryButton.setTitle(Constants.signInButtonTitleText, for: .normal)
                self.alternatorLabelLabel.text = Constants.signInLabelText
                
                UIView.animate(withDuration: 0.2) {
                    self.usernameIconView.layer.opacity = 1
                    self.usernameTextField.layer.opacity = 1
                    self.mainButton.layer.opacity = 1
                }
            }
            
            changeConstraintsToSignUp(parent: parent)
        }
    }
}
