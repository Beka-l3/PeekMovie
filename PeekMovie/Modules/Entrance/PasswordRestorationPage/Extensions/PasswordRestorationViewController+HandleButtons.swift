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
            
        case .sendVerificationCode:
            break
            
        case .resetPassword:
            viewComponents.changeState(to: .enterEmail, parent: view)
            passwordRestorationState = .enterEmail
            
        }
    }
    
    @objc func handleSecondaryButton() {
        viewComponents.changeState(to: .resetPassword, parent: view)
        passwordRestorationState = .resetPassword
    }
    
    @objc func handleDoneFromKeyboard() {
        
    }
}
