//
//  PasswordRestorationViewController+HandleButtons.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.11.2023.
//

import UIKit


extension PasswordRestorationViewController {
    
    @objc func handleMainButton() {
        switch passwordRestorationState {
            
        case .enterEmail:
            viewComponents.changeState(to: .sendVerificationCode, parent: view)
            passwordRestorationState = .sendVerificationCode
            viewComponents.emailTextField.resignFirstResponder()
            
        case .sendVerificationCode:
            break
            
        case .resetPassword:
            viewComponents.changeState(to: .enterEmail, parent: view)
            passwordRestorationState = .enterEmail
            viewComponents.passwordTextField.resignFirstResponder()
            
        }
        
    }
    
    @objc func handleSecondaryButton() {
        // state = validate code  // after timer resend code LOGIC
        
        /// temporary logic to change state
//        viewComponents.changeState(to: .resetPassword, parent: view)
//        passwordRestorationState = .resetPassword
    }
    
    @objc func handleDoneFromKeyboard() {
        
    }
}
