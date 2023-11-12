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
            if !isSetup {
                UIView.animate(withDuration: Constants.ChangeState.animationDuration) {
                    self.backgroundImage.layer.opacity = Constants.ChangeState.fullOpacity
                    self.backgroundImageBW.layer.opacity = Constants.ChangeState.zeroOpacity
                }
                
                UIView.animate(withDuration: Constants.ChangeState.animationDurationPart1) {
                    self.mainButton.layer.opacity = Constants.ChangeState.zeroOpacity
                    self.alternatingHStack.layer.opacity = Constants.ChangeState.zeroOpacity
                    
                } completion: { _ in
                    
                    self.mainButton.setTitle(Constants.loginButtonTitleText, for: .normal)
                    self.secondaryButton.setTitle(Constants.signUpButtonTitleText, for: .normal)
                    self.alternatorLabelLabel.text = Constants.signUpLabelText
                    
                    UIView.animate(withDuration: Constants.ChangeState.animationDurationPart2) {
                        self.usernameIconView.layer.opacity = Constants.ChangeState.zeroOpacity
                        self.usernameTextField.layer.opacity = Constants.ChangeState.zeroOpacity
                        
                    } completion: { _ in
                        
                        UIView.animate(withDuration: Constants.ChangeState.animationDurationPart3, delay: Constants.ChangeState.animationDurationDelay) {
                            self.mainButton.layer.opacity = Constants.ChangeState.fullOpacity
                            self.alternatingHStack.layer.opacity = Constants.ChangeState.fullOpacity
                            self.tertiaryButton.layer.opacity = Constants.ChangeState.fullOpacity
                        }
                    }
                }
            
                changeConstraintsToSignIn(parent: parent)
            }
            
        case .signUp:
            UIView.animate(withDuration: Constants.ChangeState.animationDuration) {
                self.backgroundImage.layer.opacity = Constants.ChangeState.zeroOpacity
                self.backgroundImageBW.layer.opacity = Constants.ChangeState.fullOpacity
            }
            
            UIView.animate(withDuration: Constants.ChangeState.animationDurationPart1) {
                self.mainButton.layer.opacity = Constants.ChangeState.zeroOpacity
                self.alternatingHStack.layer.opacity = Constants.ChangeState.zeroOpacity
                self.tertiaryButton.layer.opacity = Constants.ChangeState.zeroOpacity
                
            } completion: { _ in
                
                self.mainButton.setTitle(Constants.signUpButtonTitleText, for: .normal)
                self.secondaryButton.setTitle(Constants.signInButtonTitleText, for: .normal)
                self.alternatorLabelLabel.text = Constants.signInLabelText
                
                UIView.animate(withDuration: Constants.ChangeState.animationDurationPart2) {
                    self.usernameIconView.layer.opacity = Constants.ChangeState.fullOpacity
                    self.usernameTextField.layer.opacity = Constants.ChangeState.fullOpacity
                    
                } completion: { _ in
                    
                    UIView.animate(withDuration: Constants.ChangeState.animationDurationPart3, delay: Constants.ChangeState.animationDurationDelay) {
                        self.mainButton.layer.opacity = Constants.ChangeState.fullOpacity
                        self.alternatingHStack.layer.opacity = Constants.ChangeState.fullOpacity
                    }
                }
            }
            
            changeConstraintsToSignUp(parent: parent)
        }
    }
}
