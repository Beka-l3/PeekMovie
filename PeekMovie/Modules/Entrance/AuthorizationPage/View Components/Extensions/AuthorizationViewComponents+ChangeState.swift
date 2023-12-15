//
//  SignInPageViewComponents+changeState.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 09.11.2023.
//

import UIKit


extension AuthorizationViewComponents {
    func changeState(to state: AuthorizationViewController.State, parent: UIView? = nil, isSetup: Bool = false) {
        
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
                    
                    if self.setMainButtonEnabled {
                        self.enableMainButton()
                    } else {
                        self.disableMainButton()
                    }
                    
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
                
            } else {
                
                usernameIconView.layer.opacity = Constants.ChangeState.zeroOpacity
                usernameTextField.layer.opacity = Constants.ChangeState.zeroOpacity
                backgroundImageBW.layer.opacity = Constants.ChangeState.zeroOpacity
                
                if self.setMainButtonEnabled {
                    self.enableMainButton()
                } else {
                    self.disableMainButton()
                }
                
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
                
                if self.setMainButtonEnabled {
                    self.enableMainButton()
                } else {
                    self.disableMainButton()
                }
                
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


extension AuthorizationViewComponents {
    
//    MARK: sign in
    func checkSignInComponents(with validation: Bool, isStateChange: Bool = false) {
        
        switch (isMainButtonEnabled, validation) {
            
        case (false, true):
            if isStateChange {
                setMainButtonEnabled = true
            } else {
                enableMainButton()
            }
            
        case (true, false):
            if isStateChange {
                setMainButtonEnabled = false
            } else {
                disableMainButton()
            }
            
        default:
            break
            
        }
        
    }
    
    
//    MARK: sign up
    func checkSignUpComponents(with validation: Bool, isStateChange: Bool = false) {
        
        switch (isMainButtonEnabled, validation) {
            
        case (false, true):
            if isStateChange {
                setMainButtonEnabled = true
            } else {
                enableMainButton()
            }
            
        case (true, false):
            if isStateChange {
                setMainButtonEnabled = false
            } else {
                disableMainButton()
            }
            
        default:
            break
            
        }
        
    }
    
}
