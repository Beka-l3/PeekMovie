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
            changeState(to: .sendVerificationCode)
            viewComponents.emailTextField.resignFirstResponder()
            
        case .sendVerificationCode:
            break
            
        case .resetPassword:
            dismiss(animated: true)
            viewComponents.passwordTextField.resignFirstResponder()
            
        }
        
    }
    
    @objc func handleSecondaryButton() {
        
        switch passwordRestorationState {
        
        case .enterEmail:
            break
            
        case .sendVerificationCode:
            viewComponents.pinCodeBlockView.clearAll()
            viewComponents.startCountDown()
        
        case .resetPassword:
            break
            
        }
        
    }
    
}
