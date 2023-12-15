//
//  AuthorizationViewController+ChangeState.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 15.12.2023.
//

import Foundation


extension AuthorizationViewController {
    
    func changeState(to state: State) {
        
        entranceState = state
        viewComponents.changeState(to: state, parent: view)
        
        switch state {
            
        case .signIn:
            if
                let emailString = viewComponents.emailTextField.text, !emailString.isEmpty,
                let passwordString = viewComponents.passwordTextField.text, !passwordString.isEmpty
            {
                
                viewComponents.checkSignInComponents(with: true, isStateChange: true)
                
            } else {
                
                viewComponents.checkSignInComponents(with: false, isStateChange: true)
                
            }
            
            
        case .signUp:
            
            if
                let emailString = viewComponents.emailTextField.text,
                let username = viewComponents.usernameTextField.text, !username.isEmpty,
                let passwordString = viewComponents.passwordTextField.text
            {
                
                let validation = Service.shared.isValidEmailAddress(emailString) && Service.shared.isValidPassword(passwordString)
                viewComponents.checkSignUpComponents(with: validation, isStateChange: true)
                
            } else {
                
                viewComponents.checkSignUpComponents(with: false, isStateChange: true)
                
            }
            
        }
    }
    
}
