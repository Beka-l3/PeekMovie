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
        
        checkMainButtonAppearance(isStateChange: true)
        
    }
    
    
    func checkMainButtonAppearance(isStateChange: Bool = false) {
        switch entranceState {
            
        case .signIn:
            if
                let emailString = viewComponents.emailTextField.text, !emailString.isEmpty,
                let passwordString = viewComponents.passwordTextField.text, !passwordString.isEmpty
            {
                
                viewComponents.mainButtonAppearance(with: true, isStateChange: isStateChange)
                
            } else {
                
                viewComponents.mainButtonAppearance(with: false, isStateChange: isStateChange)
                
            }
            
            
        case .signUp:
            
            if
                let emailString = viewComponents.emailTextField.text,
                let username = viewComponents.usernameTextField.text, !username.isEmpty,
                let passwordString = viewComponents.passwordTextField.text
            {
                
                let validation = Service.shared.isValidEmailAddress(emailString) && Service.shared.isValidPassword(passwordString)
                viewComponents.mainButtonAppearance(with: validation, isStateChange: isStateChange)
                
            } else {
                
                viewComponents.mainButtonAppearance(with: false, isStateChange: isStateChange)
                
            }
            
        }
    }
    
}
