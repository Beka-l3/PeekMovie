//
//  PasswordRestorationViewComponents+ChangeState.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 14.11.2023.
//

import UIKit


extension PasswordRestorationViewComponents {
    func changeState(to state: PasswordRestorationViewController.State, parent: UIView? = nil, isSetup: Bool = false) {
        
        switch state {
            
        case .enterEmail:
            mainButton.setTitle(Constants.getCodeButtonText, for: .normal)
            captionLabel.text = Constants.weSendCodeText
            emailIconView.layer.opacity = 1
            emailTextField.layer.opacity = 1
            emailLabel.layer.opacity = 0
            passwordIconView.layer.opacity = 0
            passwordTextField.layer.opacity = 0
            verificationCodeView.layer.opacity = 0
            mainButton.layer.opacity = 1
            secondaryButton.layer.opacity = 0
            timerLabel.layer.opacity = 0
            
        case .sendVerificationCode:
            captionLabel.text = Constants.enterCodeText
            emailIconView.layer.opacity = 0
            emailTextField.layer.opacity = 0
            emailLabel.layer.opacity = 1
            passwordIconView.layer.opacity = 0
            passwordTextField.layer.opacity = 0
            verificationCodeView.layer.opacity = 1
            mainButton.layer.opacity = 0
            secondaryButton.layer.opacity = 1
            timerLabel.layer.opacity = 1
            
        case .resetPassword:
            mainButton.setTitle(Constants.resetPasswordButtonText, for: .normal)
            captionLabel.text = Constants.resetCodeText
            emailIconView.layer.opacity = 0
            emailTextField.layer.opacity = 0
            emailLabel.layer.opacity = 1
            passwordIconView.layer.opacity = 1
            passwordTextField.layer.opacity = 1
            verificationCodeView.layer.opacity = 0
            mainButton.layer.opacity = 1
            secondaryButton.layer.opacity = 0
            timerLabel.layer.opacity = 0
            
        }
    }
}
