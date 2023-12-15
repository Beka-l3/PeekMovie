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
                viewComponents.checkGetCodeStateComponents(withValidation: Service.shared.isValidEmailAddress(emailAddressString: emailAddressString))
            } else {
                viewComponents.checkGetCodeStateComponents(withValidation: false)
            }
            
        case .sendVerificationCode:
            viewComponents.prepareSendVerificationCodeStateComponents()
            viewComponents.startCountDown()
            
        case .resetPassword:
            if let passwordString = viewComponents.passwordTextField.text {
                viewComponents.checkResetPasswordStateComponents(withValidation: Service.shared.isValidEmailAddress(emailAddressString: passwordString))
            } else {
                viewComponents.checkResetPasswordStateComponents(withValidation: false)
            }
            
        }
        
    }
    
}
