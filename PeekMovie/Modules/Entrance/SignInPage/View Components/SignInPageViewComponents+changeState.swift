//
//  SignInPageViewComponents+changeState.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 09.11.2023.
//

import UIKit


extension SignInPageViewComponents {
    func changeState(to state: SignInPageViewController.State, isSetup: Bool = false) {
        switch state {
            
        case .signIn:
            usernameIconView.layer.opacity = .zero
            usernameTextField.layer.opacity = .zero
            tertiaryButton.layer.opacity = 1
            
            mainButton.setTitle(Constants.loginButtonTitleText, for: .normal)
            secondaryButton.setTitle(Constants.signUpButtonTitleText, for: .normal)
            alternatorLabelLabel.text = Constants.signUpLabelText
            
            if !isSetup {
                changeConstraintsToSignIn()
            }
            
        case .signUp:
            usernameIconView.layer.opacity = 1
            usernameTextField.layer.opacity = 1
            tertiaryButton.layer.opacity = .zero
            
            mainButton.setTitle(Constants.signUpButtonTitleText, for: .normal)
            secondaryButton.setTitle(Constants.signInButtonTitleText, for: .normal)
            alternatorLabelLabel.text = Constants.signInLabelText
            
            changeConstraintsToSignUp()
            
        }
    }
}
