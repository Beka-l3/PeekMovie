//
//  PasswordRestorationViewController+ChangeState.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 11.12.2023.
//

import UIKit


extension PasswordRestorationViewController {
    
    func changeState(to state: PasswordRestorationViewController.State) {
        
        passwordRestorationState = state
        viewComponents.changeState(to: state, parent: view)
        
        switch state {
            
        case .enterEmail:
            if let emailAddressString = viewComponents.emailTextField.text {
                viewComponents.checkGetCodeStateComponents(with: Service.shared.isValidEmailAddress(emailAddressString))
            } else {
                viewComponents.checkGetCodeStateComponents(with: false)
            }
            
        case .sendVerificationCode:
            viewComponents.prepareSendVerificationCodeStateComponents()
            viewComponents.startCountDown()
            
        case .resetPassword:
            if let passwordString = viewComponents.passwordTextField.text {
                viewComponents.checkResetPasswordStateComponents(with: Service.shared.isValidEmailAddress(passwordString))
            } else {
                viewComponents.checkResetPasswordStateComponents(with: false)
            }
            
        }
        
    }
    
}
